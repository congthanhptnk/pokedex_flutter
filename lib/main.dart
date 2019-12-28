import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/team.dart';
import 'package:pokedex_flutter/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 245, 98, 52),
        primaryColorDark: Color.fromARGB(255, 198, 113, 0),
        primaryColorLight: Color.fromARGB(255, 247, 143, 110),
        accentColor: Color.fromARGB(255, 246, 115, 74),
        scaffoldBackgroundColor: Color.fromARGB(255, 233, 237, 240),
      ),
      home: ChangeNotifierProvider<Team>(
        create: (context) => Team(),
        child: HomeScreen(),
      ),
    );
  }
}
