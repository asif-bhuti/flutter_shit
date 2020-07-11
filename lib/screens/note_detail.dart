import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  String appBarTitle;
  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return _NoteDetailState(this.appBarTitle);
  }
}

class _NoteDetailState extends State<NoteDetail> {
  String appBarTitle;
  static var _priorities = ['high', 'low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  _NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.bodyText2;

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(this.appBarTitle),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                moveToLastScreen();
              },
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: ListView(
            children: [
              ListTile(
                title: DropdownButton(
                  items: _priorities
                      .map((String dropDownItem) => DropdownMenuItem(
                            child: Text(dropDownItem),
                            value: dropDownItem,
                          ))
                      .toList(),
                  style: titleStyle,
                  value: 'low',
                  onChanged: (value) {
                    setState(() {
                      debugPrint('User selected $value');
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: titleStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  style: titleStyle,
                  controller: titleController,
                  onChanged: (value) {
                    debugPrint('Title Note');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: titleStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  style: titleStyle,
                  controller: descriptionController,
                  onChanged: (value) {
                    debugPrint('Description Note');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.1,
                        ),
                        onPressed: () {
                          debugPrint('Save button pressed');
                        },
                      ),
                    ),
                    Container(
                      width: 5,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.1,
                        ),
                        onPressed: () {
                          debugPrint('Delete button pressed');
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() => Navigator.pop(context);
}
