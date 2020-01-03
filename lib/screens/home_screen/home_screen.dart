import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemons.dart';
import 'package:pokedex_flutter/models/team.dart';
import 'package:pokedex_flutter/screens/home_screen/scroll_cards.dart';
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
  // MainCard focusedCard;

  @override
  void initState() {
    _pageCtrl.addListener(() {
      setState(() {
        currentPage = _pageCtrl.page;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  void _handlePageChanged(Pokemons pokemons, int page) {
    if (page == (pokemons.pokemons.length - 1)) {
      pokemons.getAllPokemons();
    }
  }

  Widget _buildCards(BuildContext context) {
    return Consumer<Pokemons>(
      builder: (context, pokemons, child) {
        return PageView.builder(
          controller: _pageCtrl,
          scrollDirection: Axis.horizontal,
          itemCount: pokemons.pokemons.length,
          onPageChanged: (int page) {
            _handlePageChanged(pokemons, page);
          },
          itemBuilder: (context, int curIndex) {
            return ScrollCard(
              currentIndex: curIndex,
              currentPage: currentPage,
              card: MainCard(
                name: '${pokemons.pokemons[curIndex].name}',
                spriteUrl: '${pokemons.pokemons[curIndex].sprite}',
                types: pokemons.pokemons[curIndex].types,
                abilities: ['Volt Absorb', 'Quick Feet'],
                id: pokemons.pokemons[curIndex].id,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 20,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                margin: EdgeInsets.only(top: 16, bottom: 0, right: 0, left: 0),
                child: _buildCards(context),
              ),
            ),
            Expanded(
              flex: 1,
              child: Consumer<Team>(
                builder: (context, team, child) {
                  return IconButton(
                    color: Colors.white70,
                    icon: Icon(
                      Icons.add,
                    ),
                    iconSize: 20,
                    onPressed: () {
                      // team.add(focusedCard.name);
                      print('clicked ${team.names}');
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
