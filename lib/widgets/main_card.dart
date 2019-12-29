import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/color_palete.dart';

class MainCard extends StatelessWidget {
  final String name;
  final String spriteUrl;
  final int id;
  final List<String> types;
  final List<String> abilities;
  final BorderRadiusGeometry myBorderRadius = BorderRadius.circular(10);
  final ColorPalete _color;

  MainCard({
    @required this.name,
    @required this.spriteUrl,
    @required this.types,
    @required this.abilities,
    @required this.id,
  }) : _color = typeColor[types[0].toLowerCase()];

  List<Widget> _buildTypes(List<String> list, BuildContext context) {
    print(id);
    List<Widget> listTypes = [];
    for (String i in list) {
      listTypes.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: _color.secondary,
          ),
          child: Text(i),
        ),
      );
    }

    return listTypes;
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: myBorderRadius,
        border: Border.all(
          color: _color.primary,
          width: 5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            padding: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              borderRadius: myBorderRadius,
              color: _color.primary,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Type',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4, left: 1, bottom: 1, right: 1),
                  padding: EdgeInsets.only(top: 4, bottom: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: myBorderRadius,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _buildTypes(this.types, context),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            padding: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              borderRadius: myBorderRadius,
              color: _color.primary,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Abilities',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4, left: 1, bottom: 1, right: 1),
                  padding: EdgeInsets.only(top: 4, bottom: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: myBorderRadius,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _buildTypes(this.abilities, context),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Card(
        color: _color.background,
        shape: RoundedRectangleBorder(borderRadius: myBorderRadius),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: myBorderRadius,
                    color: _color.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          this.spriteUrl,
                        ),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                      ),
                      Text(
                        this.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    color: _color.primary,
                    borderRadius: myBorderRadius,
                  ),
                  child: Image(
                    image: NetworkImage(
                        'https://pokeres.bastionbot.org/images/pokemon/$id.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: _buildInfo(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
