import 'dart:async';
import 'dart:convert';
import 'package:pokedex_flutter/models/pokemons.dart';
import 'package:http/http.dart' as http;

Future<Pokemons> fetchPokemons() async {
  final response = await http.get('https://pokeapi.co/api/v2/pokemon');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return fetchSingleDatas(Pokemons.fromJson(json.decode(response.body)));
    //  Pokemons.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<Pokemons> fetchSingleDatas(Pokemons listPokes) async {
  List<Future<http.Response>> f = [];

  listPokes.pokemons.forEach((p) {
    f.add(http.get(p.url));
  });

  final responses = await Future.wait(f);

  for (var r in responses) {
    if (r.statusCode == 200) {
      int x = json.decode(r.body)['id'];
      listPokes.pokemons[x - 1]
        ..sprite = jsonDecode(r.body)['sprites']['front_default']
        ..primaryType = jsonDecode(r.body)['types'][0]['type']['name'];
      // ..secondaryType = jsonDecode(r.body)['types'][1]['type']['name'];
    }
  }

  return listPokes;
}
