import 'package:flutter/material.dart';
import 'package:infinite_scroll_app/models/picture.dart';

import '../../presentations/picture_modal/picture_modal_content.dart';

class PictureModalContentStateful extends StatefulWidget {
  final PictureCard picture;
  final Function(String id) likeToggle;

  const PictureModalContentStateful({Key? key, required this.picture, required this.likeToggle})
      : super(key: key);

  @override
  PictureModalContent createState() => PictureModalContent();
}
