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
  String next = "";
  final List<Pokemon> _pokemons = [];
  bool loading;

  Pokemons() {
    getAllPokemons();
  }

  void setState(List<Pokemon> pokemons) {
    _pokemons.addAll(pokemons);
    notifyListeners();
  }

  void getAllPokemons() async {
    print("getAll called");
    List<Pokemon> list = await fetchPokemons(this);

    setState(list);
  }

  get pokemons => _pokemons;
}
