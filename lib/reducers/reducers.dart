import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/app_state.dart';
import '../models/picture.dart';

AppState fetchPicturesRequested(
    AppState state, FetchPicturesRequestedAction action) {
  return AppState(state.pictures, state.page);
}

AppState fetchPicturesSuccess(
    AppState state, FetchPicturesSuccessAction action) {
  var newPictures = List<PictureCard>.from(state.pictures)
    ..addAll(action.payload);
  return AppState(newPictures, state.page + 1);
}

AppState fetchPicturesFailure(
    AppState state, FetchPicturesFailureAction action) {
  return AppState(state.pictures, state.page);
}

AppState likeToggle(AppState state, LikeToggleAction action) {
  var index =
      state.pictures.indexWhere((picture) => picture.id == action.payload);

  if (index != -1) {
    var copiedPictures = List<PictureCard>.from(state.pictures);
    copiedPictures[index].like = !copiedPictures[index].like;

    return AppState(copiedPictures, state.page);
  }
  return state;
}

final Reducer<AppState> appStateReducer = combineReducers<AppState>([
  TypedReducer<AppState, FetchPicturesRequestedAction>(
      fetchPicturesRequested),
  TypedReducer<AppState, FetchPicturesSuccessAction>(fetchPicturesSuccess),
  TypedReducer<AppState, FetchPicturesFailureAction>(fetchPicturesFailure),
  TypedReducer<AppState, LikeToggleAction>(likeToggle),
]);
