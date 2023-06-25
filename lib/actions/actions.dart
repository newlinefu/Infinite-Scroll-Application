import '../models/picture.dart';

enum AppActionNames {
  fetchPictures,
  fetchPicturesSuccess,
  fetchPicturesFailure,
  selectedPictureToggle,
  likeToggle
}

class FetchPicturesAction {
  int payload;

  FetchPicturesAction(this.payload);
}

class FetchPicturesSuccessAction {
  List<PictureCard> payload;

  FetchPicturesSuccessAction(this.payload);
}

class FetchPicturesFailureAction {
  FetchPicturesFailureAction();
}

class LikeToggleAction {
  String payload;

  LikeToggleAction(this.payload);
}

class FetchPicturesRequestedAction {
  FetchPicturesRequestedAction();
}
