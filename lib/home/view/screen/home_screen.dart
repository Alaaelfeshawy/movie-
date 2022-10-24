import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/search/view/screen/search_screen.dart';
import '../../../core/data/api_manager.dart';
import '../../../core/services/alert.dart';
import '../../../core/services/generic_error_handler.dart';
import '../../../core/utils/utils.dart';
import '../../../core/view/widgets/app_screen.dart';
import '../../../di/injection_container.dart';
import '../../logic/home/home_cubit.dart';
import '../widgets/home_data.dart';
import '../widgets/movie_list_widget.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<HomeCubit>(),
        ),
      ],
      child: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadHomeSections();
    });
  }

  void loadHomeSections() {
    context.read<HomeCubit>().getTopRatedMovies();
    context.read<HomeCubit>().getNowPlayingMovies();
    context.read<HomeCubit>().getUpcomingMovies();
  }
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeData(),
    SearchScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeCubit, HomeState>(
          listenWhen: (previous, current) =>
              previous.movieResponseModel != current.movieResponseModel,
          listener: (context, state) {
            if (notNullNorEmpty(state.movieResponseModel?.data)) {}
          },
        ),
        BlocListener<HomeCubit, HomeState>(
          listenWhen: (previous, current) =>
              previous.failure != current.failure,
          listener: (context, state) {
            final failure = state.failure;
            if (failure is ErrorFailure) {
              final error = failure.error;
              if (error is MessageResponse) {
                Alert.instance.error(context, error.message);
              }
            } else if (failure != null) {
              GenericErrorHandler.instance.handle(
                failure: failure,
                onRetry: () => context.read<HomeCubit>().retry(),
                context: context,
              );
            }
          },
        ),
      ],
      child: AppScreen(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: false,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.blueAccent,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          enableFeedback: false,
          onTap: _onItemTapped,
        ),
        child: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.loading
                  ? const Center(child: CircularProgressIndicator())
                  : _widgetOptions[_selectedIndex];
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
