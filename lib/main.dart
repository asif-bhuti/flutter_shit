import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator',
      home: SIForm(),
      theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black,
          fontFamily: 'PTSans'),
    ));

class SIForm extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _SIForm();
  }
}

class _SIForm extends State<SIForm> {

  var _formKey = GlobalKey<FormState>();

  var _currencies = ['Taka', 'Rupee', 'Dollar', 'Others'];
  var _currentItemSelected = '';
  final _minimumPadding = 5.0;
  var displayResult = '';
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentItemSelected=_currencies[0];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(
            children: [
              getImageAsset(),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: getTextField('Principal', 'Enter principal e.g. 12000',principalController),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: getTextField('Rate of Interest', 'In percentage',roiController),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: [
                    Expanded(child: getTextField('Term', 'Time in years',termController)),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        value: _currentItemSelected,
                        onChanged: (String newValueSelected) {
                          _onDropDownItemSelected(newValueSelected);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        child: Text('Calculate', textScaleFactor: 1.2),
                        onPressed: () {
                          setState(() {
                            if(_formKey.currentState.validate()){
                              this.displayResult=_calculateTotal();}
                          });
                        },
                      ),
                    ),
                    Container(
                      width: _minimumPadding,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text(
                          'Reset',
                          textScaleFactor: 1.2,
                        ),
                        onPressed: () {
                          _reset();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(_minimumPadding * 2),
                child: Text(this.displayResult),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getImageAsset() {
    return Container(
      child: Image(
        image: AssetImage('images/bank.png'),
        width: 125,
        height: 125,
      ),
      padding: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  Widget getTextField(String getLabelText, String getHintText, TextEditingController getController) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: getLabelText,
          hintText: getHintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      controller: getController,
      validator: (String value){
        if(value.isEmpty){
          return 'Please Enter $getLabelText';
        }
      },
    );
  }

  void _onDropDownItemSelected(String newValue){
    setState(() {
      this._currentItemSelected=newValue;
    });
  }

  String _calculateTotal(){
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmount = principal*(principal*roi*term)/100;

    return 'After $term year/s your interest will be worth $totalAmount $_currentItemSelected';
  }

  void _reset(){
    _currentItemSelected=_currencies[0];
    principalController.text='';
    roiController.text='';
    termController.text='';
    displayResult='';
  }

}
