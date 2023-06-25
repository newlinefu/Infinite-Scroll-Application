import 'dart:math';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_app/containers/pictures_feed_container.dart';

import '../containers/single_picture_card_container.dart';

class PicturesFeed extends StatelessWidget {
  final PicturesFeedProperties state;

  const PicturesFeed({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GridView.count(
        controller: state.scrollController,
        crossAxisCount: 2,
        children:
            List.from(state.pictures.map((picture) => SinglePictureContainer(
                  picture: picture,
                ))));
  }
}
