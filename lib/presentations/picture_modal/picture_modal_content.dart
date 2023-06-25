import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../containers/picture_modal/picture_modal_content.dart';

class PictureModalContent extends State<PictureModalContentStateful> {

  late bool modalPictureLikeValue;

  PictureModalContent({Key? key });

  @override
  void initState() {
    super.initState();
    modalPictureLikeValue = widget.picture.like;
  }

  @override
  Widget build(context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
            child: Stack(
              children: [
                Column(mainAxisSize: MainAxisSize.min, children: [
                  Stack(children: [
                    Image(image: NetworkImage(widget.picture.big)),
                    Positioned(
                      bottom: 10.0,
                      left: 10.0,
                      child: IconButton(
                        icon: Icon(
                            modalPictureLikeValue ? Icons.favorite : Icons
                                .favorite_outline),
                        tooltip: 'Like',
                        onPressed: () {
                          widget.likeToggle(widget.picture.id);
                          setState(() {
                            modalPictureLikeValue = !modalPictureLikeValue;
                          });
                        },
                      ),
                    )
                  ])
                ]),
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )));
  }
}