import 'package:flutter/material.dart';
import 'package:pokedex_flutter/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 255, 160, 0),
        primaryColorDark: Color.fromARGB(255, 198, 113, 0),
        primaryColorLight: Color.fromARGB(255, 255, 209, 73),
        accentColor: Color.fromARGB(255, 255, 214, 0),
        scaffoldBackgroundColor: Color.fromARGB(255, 233, 237, 240),
      ),
      home: HomeScreen(),
    );
  }
}
