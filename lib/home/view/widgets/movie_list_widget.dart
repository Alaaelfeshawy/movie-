
import 'package:flutter/material.dart';

import '../../data/model/home/movie_response_model.dart';
import 'movie_item_widget.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key, required this.model , this.scrollDirection,this.title}) : super(key: key);

  final MovieResponseModel? model;
  final Axis? scrollDirection;
  final String? title;
  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title ?? '',
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 300,
            child: ListView.separated(
                scrollDirection: widget.scrollDirection ?? Axis.horizontal,
                itemBuilder: (context, index) =>
                    MovieItemWidget(data: widget.model?.data[index]),
                separatorBuilder: (index, context) => const SizedBox(
                  width: 20,
                ),
                itemCount: widget.model?.data.length ?? 0),
          ),
        ),
      ],
    );
  }
}

