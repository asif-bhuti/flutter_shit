import 'package:flutter/material.dart';

void main() => runApp(FavoriteCity());

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCity();
  }
}

class _FavoriteCity extends State<FavoriteCity> {
  String city = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('City'),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                onSubmitted: (String string) {
                  setState(() {
                    city = string;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'You entered city: $city',
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
