// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../constants/assets.dart';
// import '../widgets/app_screen.dart';
// import 'walkthrough.dart';
//
// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);
//
//   static const id = '/';
//
//   @override
//   State<Splash> createState() => _SplashState();
// }
//
// class _SplashState extends State<Splash> {
//   // static const shouldCallEndPoints = 1;
//   int endPointsCalled = 0;
//   // late SharedPreferences preferences;
//
//   @override
//   void initState() {
//     super.initState();
//     // loadSharedPreferences();
//     // callAllEndpoints();
//     // FlutterBranchSdk.getLatestReferringParams().then((value) {
//     //   context.read<DeeplinkCubit>().onNewLink(value);
//     // });
//   }
//
//   // Future<void> loadSharedPreferences() async {
//   //   preferences = await SharedPreferences.getInstance();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return AppScreen(
//       lightStatusBar: true,
//       child: Stack(
//         children: [
//           Text("Splash",style: TextStyle(color: Colors.black),)
//           // SvgPicture.asset(
//           //  " Assets.brimoreLogoBG",
//           //   width: double.infinity,
//           //   height: double.infinity,
//           //   fit: BoxFit.cover,
//           // ),
//           // Center(child: SvgPicture.asset("Assets.brimoreLogo")),
//         ],
//       ),
//     );
//   }
//
//
//
// }
