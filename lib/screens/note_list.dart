import 'package:flutter/material.dart';

import 'note_detail.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoteListState();
  }
}

class _NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Note'),
        ),
        body: getNoteListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('FAB was clicked');
            navigateDetailNote('Add Note');
          },
          tooltip: 'Add Note',
          child: Icon(Icons.add),
        ));
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.bodyText2;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text(
                'Dummy Title',
                style: titleStyle,
              ),
              subtitle: Text(
                'Dummy dat',
                style: titleStyle,
              ),
              trailing: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                debugPrint('The item was clicked');
                navigateDetailNote('Edit Note');
              },
            ),
          );
        });
  }

  void navigateDetailNote(String title) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NoteDetail(title)));
  }
}
