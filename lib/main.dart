import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:infinite_scroll_app/presentations/app_root.dart';
import 'package:infinite_scroll_app/reducers/reducers.dart';
import 'package:infinite_scroll_app/sagas/fetch_pictures.dart';
import 'package:redux/redux.dart';
import 'package:redux_saga/redux_saga.dart';

import 'models/app_state.dart';

void main() {
  var sagaMiddleware = createSagaMiddleware();
  var store = Store<AppState>(
    appStateReducer,
    initialState: AppState.init(),
    middleware: [applyMiddleware(sagaMiddleware)],
  );

  sagaMiddleware.setStore(store);
  sagaMiddleware.run(fetchPicturesSaga);

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const AppRoot()
    );
  }
}
