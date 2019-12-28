import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/team.dart';
import 'package:pokedex_flutter/screens/home_screen/scroll_cards.dart';
import 'package:pokedex_flutter/widgets/main_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MainCard> cards = [
    MainCard(
      name: 'Jolteon',
      spriteUrl: 'assets/images/jolteon_sprite.png',
      types: ['Electric'],
      abilities: ['Volt Absorb', 'Quick Feet'],
    ),
    MainCard(
      name: 'Flareon',
      spriteUrl: 'assets/images/flareon_sprite.png',
      types: ['Fire'],
      abilities: ['Flash Fire', 'Guts'],
    ),
    MainCard(
      name: 'Leafeon',
      spriteUrl: 'assets/images/leafeon_sprite.png',
      types: ['Grass'],
      abilities: ['Leaf Guard', 'Clorophyll'],
    )
  ];

  final PageController _pageCtrl = PageController(
      viewportFraction: 0.8); // Determine the size of out of screen cards
  double currentPage = 0.0;
  MainCard focusedCard;

  @override
  void initState() {
    focusedCard = cards[0];
    _pageCtrl.addListener(() {
      setState(() {
        currentPage = _pageCtrl.page;
        focusedCard = cards[_pageCtrl.page.round()];
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
              child: PageView.builder(
                controller: _pageCtrl,
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, int curIndex) {
                  return ScrollCard(
                    currentIndex: curIndex,
                    currentPage: currentPage,
                    card: cards[curIndex],
                  );
                },
              ),
              margin: EdgeInsets.only(top: 32, bottom: 0, right: 0, left: 0),
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
                    team.add(focusedCard.name);
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
