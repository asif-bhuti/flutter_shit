import 'package:flutter/material.dart';


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
