import 'dart:async';
import 'dart:convert';
import 'package:pokedex_flutter/models/pokemons.dart';
import 'package:http/http.dart' as http;

Future<Pokemons> fetchPokemons() async {
  final response = await http.get('https://pokeapi.co/api/v2/pokemon');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return Pokemons.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
