import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemons.dart';
import 'package:pokedex_flutter/models/team.dart';
import 'package:pokedex_flutter/screens/home_screen/scroll_cards.dart';
import 'package:pokedex_flutter/services/fetchPokemon.dart';
import 'package:pokedex_flutter/widgets/main_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageCtrl = PageController(
      viewportFraction: 0.8); // Determine the size of out of screen cards
  double currentPage = 0.0;
  Future pokemons;
  // MainCard focusedCard;

  @override
  void initState() {
    pokemons = fetchPokemons();
    _pageCtrl.addListener(() {
      setState(() {
        currentPage = _pageCtrl.page;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('data'),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 650,
              width: double.infinity,
              margin: EdgeInsets.only(top: 32, bottom: 0, right: 0, left: 0),
              child: FutureBuilder<Pokemons>(
                future: pokemons,
                builder: (context, snap) {
                  print("yeeha");
                  if (snap.hasData) {
                    return PageView.builder(
                      controller: _pageCtrl,
                      scrollDirection: Axis.horizontal,
                      itemCount: snap.data.pokemons.length,
                      itemBuilder: (context, int curIndex) {
                        // print(snap.data.pokemons[curIndex].sprite);
                        return ScrollCard(
                          currentIndex: curIndex,
                          currentPage: currentPage,
                          card: MainCard(
                            name: '${snap.data.pokemons[curIndex].name}',
                            spriteUrl: '${snap.data.pokemons[curIndex].sprite}',
                            types: ['Electric'],
                            abilities: ['Volt Absorb', 'Quick Feet'],
                          ),
                        );
                      },
                    );
                  }

                  return CircularProgressIndicator();
                },
              ),
            ),
            Consumer<Team>(
              builder: (context, team, child) {
                return IconButton(
                  color: Theme.of(context).primaryColorDark,
                  icon: Icon(
                    Icons.favorite,
                  ),
                  iconSize: 40,
                  onPressed: () {
                    // team.add(focusedCard.name);
                    print('clicked ${team.names}');
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
