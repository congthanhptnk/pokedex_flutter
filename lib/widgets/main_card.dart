import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String name;
  final String spriteUrl;
  final List<String> types;
  final List<String> abilities;
  final BorderRadiusGeometry myBorderRadius = BorderRadius.circular(10);

  MainCard({
    @required this.name,
    @required this.spriteUrl,
    @required this.types,
    @required this.abilities,
  });

  List<Widget> _buildTypes(List<String> list) {
    List<Widget> listTypes = [];
    for (String i in list) {
      listTypes.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
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
          color: Theme.of(context).primaryColorLight,
          width: 5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Type'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildTypes(this.types),
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Column(
            children: <Widget>[
              Text('Type'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildTypes(this.abilities),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Card(
        color: Theme.of(context).primaryColor,
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
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(
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
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: myBorderRadius,
                  ),
                  child: Image(
                    image: AssetImage(this.spriteUrl),
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
