import 'package:flutter/material.dart';
import 'package:flutterappshit/screens/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Whatever',
    home: Scaffold(
      appBar: AppBar(title: Text('Long List')),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Shows some message',
          child: Icon(Icons.add)),
    ),
  ));
}

void showSnackBar(BuildContext context, String item) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text("You tapped $item"),
    duration: Duration(milliseconds: 500),
  ));
}

List getLongList() {
  return List<String>.generate(20, (index) => 'Item $index');
}

Widget getListView() {
  var listItems = getLongList();
  return ListView.builder(
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(listItems[index]),
        onTap: () {
          showSnackBar(context, listItems[index]);
        },
      );
    },
    itemCount: listItems.length,
  );
}
