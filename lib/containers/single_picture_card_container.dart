import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:infinite_scroll_app/actions/actions.dart';
import 'package:infinite_scroll_app/models/app_state.dart';
import 'package:infinite_scroll_app/models/picture.dart';

import '../presentations/pictures_feed.dart';
import '../presentations/single_picture.dart';

class SinglePictureContainerProperties {
  Function(String id) likeToggle;

  SinglePictureContainerProperties(this.likeToggle);
}

class SinglePictureContainer extends StatelessWidget {
  final PictureCard picture;

  const SinglePictureContainer({Key? key, required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SinglePictureContainerProperties>(
        converter: (store) => SinglePictureContainerProperties(
            (String id) => store.dispatch(LikeToggleAction(id))),
        builder: (context, containerProps) {
          return SinglePicture(
              containerProperties: containerProps, picture: picture);
        });
  }
}
