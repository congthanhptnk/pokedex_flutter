import 'package:flutter/material.dart';

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
  final String next;
  final List<Pokemon> pokemons;

  Pokemons({this.next, this.pokemons});

  factory Pokemons.fromJson(Map<String, dynamic> json) {
    List<Pokemon> pokeList = [];

    json['results'].forEach((r) {
      pokeList.add(Pokemon.fromJson(r));
    });

    return Pokemons(pokemons: pokeList, next: json['next']);
  }
}
