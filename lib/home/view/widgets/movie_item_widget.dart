import 'package:flutter/material.dart';
import 'package:movie/movie_details/view/screen/movie_details_screen.dart';

import '../../../core/view/widgets/image_loader.dart';
import '../../../home/data/model/home/movie_data.dart';

class MovieItemWidget extends StatefulWidget {
  const MovieItemWidget({Key? key, required this.data}) : super(key: key);

  final MovieData? data;
  @override
  State<MovieItemWidget> createState() => _MovieItemWidgetState();
}

class _MovieItemWidgetState extends State<MovieItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
            context,
            MovieDetailsScreen.id,
            arguments: {
              "MOVIE_ID": widget.data?.id
            }
        );
      },
      child: SizedBox(
        width: 200,
        child: Stack(
          children: [
            ImageLoader(
              imageUrl:
              "https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.data?.posterPath ?? ''}",
              height: 300,
              width: 200,
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconTheme(
                data: const IconThemeData(
                  color: Colors.yellow,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 35,
                    ),
                    Text(
                      widget.data?.voteAverage.toString() ?? '',
                      style: const TextStyle(
                          fontSize: 8, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Container(
                height: 30,
                width: double.infinity,
                color: Colors.white24,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  child: Text(
                    widget.data?.title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
