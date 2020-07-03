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
  var _currencies = ['Taka','Rupies', 'Drakhma', 'Pound', 'Euro', 'Dollar', 'Other'];
  var _currentItemSelected = 'Taka';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              DropdownButton<String>(
                items: _currencies
                    .map((String dropDownStringItems) => DropdownMenuItem(
                          value: dropDownStringItems,
                          child: Text(dropDownStringItems),
                        ))
                    .toList(),
                onChanged: (var newValueSelected){
                  //Some code goes here
                  _onDropDownItemSelected(newValueSelected);
                },
                value: _currentItemSelected,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'You enter city: $city',
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
