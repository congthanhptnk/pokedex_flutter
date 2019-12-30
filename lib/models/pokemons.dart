import 'package:flutter/material.dart';
import 'package:pokedex_flutter/services/fetchPokemon.dart';

class Pokemon {
  final String name;
  final String url;
  String sprite;
  List<String> types;
  List<String> abilities;
  int id;
  String img;

  Pokemon({this.name, this.url, this.sprite});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Pokemons extends ChangeNotifier {
  final List<Pokemon> _pokemons = [];

  Pokemons() {
    print("aaa");
    getAllPokemons();
  }

  void setState(List<Pokemon> pokemons) {
    _pokemons.addAll(pokemons);
    notifyListeners();
  }

  void getAllPokemons() async {
    List<Pokemon> list = await fetchPokemons();

    setState(list);
  }

  get pokemons => _pokemons;
}
