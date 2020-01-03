import 'dart:async';
import 'dart:convert';
import 'package:pokedex_flutter/models/pokemons.dart';
import 'package:http/http.dart' as http;

Future<List<Pokemon>> fetchPokemons(Pokemons curPokemons) async {
  final client = http.Client();
  List<Pokemon> pokeList = [];
  http.Response response1;

  if (curPokemons.next == "") {
    response1 = await client.get('https://pokeapi.co/api/v2/pokemon');
  } else {
    print(curPokemons.next);
    response1 = await client.get(curPokemons.next);
  }

  json.decode(response1.body)['results'].forEach((r) {
    pokeList.add(Pokemon.fromJson(r));
  });

  List<http.Response> listR =
      await Future.wait(pokeList.map((x) => client.get(x.url)));

  // for (var r in listR) {
  //   if (r.statusCode == 200) {
  //     int id = json.decode(r.body)['id'];
  //     List<String> types = [];
  //     jsonDecode(r.body)['types'].forEach((t) {
  //       types.add(t['type']['name']);
  //     });

  //     pokeList[id - 1]
  //       ..sprite = jsonDecode(r.body)['sprites']['front_default']
  //       ..types = types.reversed.toList()
  //       ..id = jsonDecode(r.body)['id'];
  //   }
  // }

  for (int i = 0; i < listR.length; i++) {
    var r = listR[i];
    if (listR[i].statusCode == 200) {
      List<String> types = [];
      jsonDecode(r.body)['types'].forEach((t) {
        types.add(t['type']['name']);
      });

      pokeList[i]
        ..sprite = jsonDecode(r.body)['sprites']['front_default']
        ..types = types.reversed.toList()
        ..id = jsonDecode(r.body)['id'];
    }
  }

  curPokemons.next = json.decode(response1.body)['next'];

  client.close();
  return pokeList;
}
