import 'package:flutter/material.dart';
import '../../models/picture.dart';
import 'picture_modal_content.dart';

class SinglePictureModalProperties {
  bool modalPictureLike;

  SinglePictureModalProperties(this.modalPictureLike);
}

class SinglePictureModal extends ModalRoute {
  PictureCard picture;
  Function(String id) likeToggle;

  SinglePictureModal({required this.picture, required this.likeToggle});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return PictureModalContentStateful(
      likeToggle: likeToggle,
      picture: picture,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        // add scale animation
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      ),
    );
  }
}
