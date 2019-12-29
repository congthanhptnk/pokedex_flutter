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
      resPokemons.pokemons[d - 1]
        ..sprite = jsonDecode(r.body)['sprites']['front_default']
        ..primaryType = jsonDecode(r.body)['types'][0]['type']['name'];
    }
  }

  client.close();
  return resPokemons;
}

// Future<Pokemons> getAllPokemons() async {
//   var client = http.Client();
//   List<String> itemsIds = ['1', '2', '3']; //different ids

//   List<http.Response> list = await Future.wait(
//       itemsIds.map((itemId) => client.get('sampleapi/$itemId/next')));

//   return list.map((response) {
//     // do processing here and return items
//     return new Item();
//   }).toList();
// }
// Future<Pokemons> fetchSingleDatas(Pokemons listPokes) async {
//   List<Future<http.Response>> f = [];

//   listPokes.pokemons.forEach((p) {
//     f.add(http.get(p.url));
//   });

//   final responses = await Future.wait(f);

//   for (var r in responses) {
//     if (r.statusCode == 200) {
//       int x = json.decode(r.body)['id'];
//       listPokes.pokemons[x - 1]
//         ..sprite = jsonDecode(r.body)['sprites']['front_default']
//         ..primaryType = jsonDecode(r.body)['types'][0]['type']['name'];
//       // ..secondaryType = jsonDecode(r.body)['types'][1]['type']['name'];
//     }
//   }

//   return listPokes;
// }
