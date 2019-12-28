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
            name: 'Jolteon',
            spriteUrl: 'assets/images/jolteon_sprite.png',
            types: ['Electric'],
            abilities: ['Volt Absorb', 'Quick Feet']),
      ),
    );
  }
}
