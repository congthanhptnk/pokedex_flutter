import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String name;
  final String spriteUrl;
  final String type;

  MainCard({
    @required this.name,
    @required this.spriteUrl,
    @required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Card(
        elevation: 2,
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  // height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
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
                flex: 4,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
