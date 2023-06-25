import 'package:flutter/material.dart';

import '../containers/pictures_feed_container.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        title: "Scroll Picture Application",
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Scroll Picture Application"),
            ),
            body: const PicturesFeedStateful()));
  }
}
