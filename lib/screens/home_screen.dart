import 'package:flutter/material.dart';
import 'package:pokedex_flutter/widgets/main_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MainCard(
          name: 'Bulbasaur',
          spriteUrl: 'assets/images/bulbasaur_sprite.png',
          type: 'grass',
        ),
      ),
    );
  }
}
