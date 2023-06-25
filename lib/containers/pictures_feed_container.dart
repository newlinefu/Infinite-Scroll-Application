import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:infinite_scroll_app/actions/actions.dart';
import 'package:infinite_scroll_app/models/app_state.dart';
import 'package:infinite_scroll_app/models/picture.dart';

import '../presentations/pictures_feed.dart';

class PicturesFeedProperties {
  Function() fetchData;
  List<PictureCard> pictures;
  ScrollController scrollController;
  int page;

  PicturesFeedProperties(
      this.fetchData, this.pictures, this.scrollController, this.page);
}

class PicturesFeedStateful extends StatefulWidget {
  const PicturesFeedStateful({Key? key}) : super(key: key);

  @override
  PictureFeedContainer createState() => PictureFeedContainer();
}

class PictureFeedContainer extends State<PicturesFeedStateful> {
  late ScrollController scrollController;

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PicturesFeedProperties>(
      converter: (store) => PicturesFeedProperties(
          () {
            store.dispatch(FetchPicturesAction(store.state.page));
          },
          store.state.pictures,
          scrollController,
          store.state.page),
      builder: (context, state) {
        return PicturesFeed(state: state);
      },
      onInit: (store) {
        store.dispatch(FetchPicturesAction(store.state.page));
        scrollController.addListener(() {
          var nextPageTrigger = scrollController.position.maxScrollExtent;
          if (scrollController.position.pixels >= nextPageTrigger) {
            store.dispatch(FetchPicturesAction(store.state.page));
          }
        });
      },
    );
  }
}
