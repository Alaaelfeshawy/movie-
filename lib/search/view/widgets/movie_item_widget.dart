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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageLoader(
              imageUrl:
              "https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.data?.posterPath ?? ''}",
              height: 300,
              width: 200,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data?.title ?? "" , style: const TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(widget.data?.overview ?? "",),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

