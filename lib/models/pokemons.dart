class Pokemon {
  final String name;
  final String url;

  Pokemon({this.name, this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Pokemons {
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
