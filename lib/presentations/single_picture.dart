import 'package:flutter/material.dart';
import 'package:infinite_scroll_app/presentations/picture_modal/single_picture_modal.dart';

import '../containers/single_picture_card_container.dart';
import '../models/picture.dart';

class SinglePicture extends StatelessWidget {
  final SinglePictureContainerProperties containerProperties;
  final PictureCard picture;

  const SinglePicture(
      {Key? key, required this.containerProperties, required this.picture})
      : super(key: key);

  dynamic openModal(BuildContext context) async {
    await Navigator.of(context).push(SinglePictureModal(
        likeToggle: containerProperties.likeToggle, picture: picture));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        width: 48.0,
        height: 48.0,
        child: Stack(children: [
          InkWell(
              onTap: () {
                openModal(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(picture.small),
                  ),
                ),
              )),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: IconButton(
              icon:
                  Icon(picture.like ? Icons.favorite : Icons.favorite_outline),
              tooltip: 'Like',
              onPressed: () {
                containerProperties.likeToggle(picture.id);
              },
            ),
          )
        ]));
  }
}
