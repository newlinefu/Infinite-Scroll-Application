import 'package:infinite_scroll_app/models/picture.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<PictureCard> pictures;

  final int page;

  const AppState(this.pictures, this.page);

  AppState.init()
      : page = 1,
        pictures = List.unmodifiable([]);

  @override
  bool operator ==(Object other) =>
      other is AppState &&
      page == other.page &&
      const ListEquality().equals(pictures, other.pictures);

  @override
  int get hashCode => Object.hash(page, pictures);

  @override
  String toString() {
    return 'page: $page | Pictures Count: ${pictures.length}';
  }
}
