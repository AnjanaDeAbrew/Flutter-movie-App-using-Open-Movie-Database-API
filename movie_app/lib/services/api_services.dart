import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/models/movie.dart';

class ApiServices {
  final url = "http://www.omdbapi.com/?s=movie&apikey=7fb12929";

  Future<List<Search>> getArticle() async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['Search'];
      List<Search> movies =
          body.map((dynamic item) => Search.fromJson(item)).toList();
      return movies;
    } else {
      throw ('Can\'t get articles');
    }
  }
}
