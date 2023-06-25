import 'package:infinite_scroll_app/actions/actions.dart';
import 'package:infinite_scroll_app/data/api_service.dart';
import 'package:infinite_scroll_app/models/picture.dart';
import 'package:redux_saga/redux_saga.dart';

// worker Saga: will be fired on UserFetchRequested actions
fetchPicturesAsync({required FetchPicturesAction action}) sync* {
  yield Try(() sync* {
    print('SAGA');
    var pictures = Result<List<PictureCard>>();
    yield Put(FetchPicturesRequestedAction());
    print(action.payload);
    yield Call(ApiService.fetchPictures, result: pictures, args: [action.payload]);
    print('BEFORE SUCCESS');
    yield Put(FetchPicturesSuccessAction(
        pictures.value == null ? [] : pictures.value!));
  }, Catch: (e, s) sync* {
    yield Put(FetchPicturesFailureAction());
  });
}

//  Starts fetchUser on each dispatched `UserFetchRequested` action.
//  Allows concurrent fetches of user.
fetchPicturesSaga() sync* {
  yield TakeEvery(fetchPicturesAsync, pattern: FetchPicturesAction);
}
