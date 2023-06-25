import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/picture.dart';

class ApiService {
  final Duration delay;

  const ApiService([this.delay = const Duration(milliseconds: 1200)]);

  static Future<dynamic> fetchPictures(int page) async {
    Uri url = Uri.https("api.unsplash.com", "photos", {
      'client_id': 'wGTlTZsuP7ahDXEFyo6dEuJ2ODFm6Vu9De0cbZYS0Fs',
      'per_page': '10',
      'page': '$page'
    });
    var client = http.Client();
    final response =
        await client.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var objectsList = jsonDecode(response.body) as List;
      var picturesCards = <PictureCard>[];
      for (var obj in objectsList) {
        picturesCards.add(PictureCard.fromJson(obj));
      }
      return Future(() => picturesCards);
    }
    return Future(() => []);
  }
}
