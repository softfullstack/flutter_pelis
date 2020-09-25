import 'package:http/http.dart' as http;
import 'package:pelis/src/models/peli_model.dart';
import 'dart:convert';

class PelisProvider {
  String _apikey = 'd5ea1b67766d6d1864a44a54b6c065f4';
  String _url = 'api.themoviedb.org';
  String _lenguage = 'es-ES';

  Future<List<Peli>> getInCinema() async {
    final url = Uri.https(_url, '/3/movie/now_playing', {
      //
      'api_key': _apikey,
      'language': _lenguage,
    });

    return await _processRes(url);
  }

  Future<List<Peli>> getInPopular() async {
    final url = Uri.https(_url, '/3/movie/popular', {
      'api_key': _apikey,
      'language': _lenguage,
    });
    return await _processRes(url);
  }

  Future<List<Peli>> _processRes(Uri url) async {
    //import the library http  https://pub.dev/packages/http#-installing-tab-
    final res = await http.get(url);
    final docodeData = json.decode(res.body);
    final peliculas = new Peliculas.fromJsonList(docodeData['results']);

    return peliculas.items;
  }
}
