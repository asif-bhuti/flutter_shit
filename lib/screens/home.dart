import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.amberAccent,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          customRow(customText(), customText(), customText()),
          customRow(customText(), customText(), customText()),
          customRow(customText(), customText(), customText()),
          customImage(),
          customRaisedButton()
        ]),
      ),
    );
  }
}

Widget customRow(Widget widget1, Widget widget2, Widget widget3) {
  return Container(
    margin: EdgeInsets.all(20),
    child: Row(
      children: [widget1, widget2, widget3],
    ),
  );
}

Widget customImage() {
  return Container(
    margin: EdgeInsets.only(left: 50, right: 50, top: 0, bottom: 25),
    child: Image(
      image: AssetImage('images/cloud.jpg'),
      width: 300,
      height: 200,
    ),
  );
}

class customText extends StatelessWidget {
  static int i = 0;
  String string;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
      child: Text(
        '$string',
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.none,
            fontFamily: 'fonts/PTSans-Italic',
            fontWeight: FontWeight.w500,
            fontSize: 20),
      ),
    ));
  }

  customText() {
    i++;
    this.string = 'String $i';
  }
}

// ignore: camel_case_types
class customRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
      child: Text('What the heck'),
      elevation: 6.0,
      onPressed: () {
        pressDialogue(context);
      },
    ));
  }

  void pressDialogue(BuildContext context) {
    var alertDia = AlertDialog(
      title: Text('halalu'),
      content: Text('lkfkkfksfsdfkflld'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDia;
        });
  }
}
