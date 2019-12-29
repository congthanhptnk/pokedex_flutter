import 'dart:async';
import 'dart:convert';
import 'package:pokedex_flutter/models/pokemons.dart';
import 'package:http/http.dart' as http;

Future<Pokemons> fetchPokemons() async {
  final client = http.Client();
  Pokemons resPokemons;

  final response1 = await client.get('https://pokeapi.co/api/v2/pokemon');

  resPokemons = Pokemons.fromJson(json.decode(response1.body));
  List<http.Response> listR =
      await Future.wait(resPokemons.pokemons.map((x) => client.get(x.url)));

  for (var r in listR) {
    if (r.statusCode == 200) {
      int d = json.decode(r.body)['id'];
      List<String> types = [];
      jsonDecode(r.body)['types'].forEach((t) {
        types.add(t['type']['name']);
      });

      resPokemons.pokemons[d - 1]
        ..sprite = jsonDecode(r.body)['sprites']['front_default']
        ..types = types
        ..id = jsonDecode(r.body)['id'];
    }
  }

  client.close();
  return resPokemons;
}
