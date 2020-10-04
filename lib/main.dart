import 'package:flutter/material.dart';

import 'konular/checkbox_radio_switch_usage.dart';
import 'konular/dropdownbutton_usage.dart';
import 'konular/textfield_calismalari.dart';
import 'konular/time_picker_usage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Eğitim Dersleri",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.grey.shade800),
      routes: {
        '/': (context) => MainPage(),
        '/GotTextField': (context) => TextFieldCalismalari(),
        '/GoCheckBoxAndRadio': (context) => CheckBoxRadioAndSwitch(),
        '/GoDropDownButton': (context) => DropDownButtonTutorial(),
        '/GoDateTime' : (context) => DateTimePickerUsage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Main Screen"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildTextFieldUsage(context),
          buildCheckBoxUsage(context),
          buildDropDownButtonUsage(context),
          buildTimeDateUsage(context)
        ],
      )),
    );
  }

  //buildCheckBoxUsage button
  Widget buildCheckBoxUsage(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, '/GoCheckBoxAndRadio'),
        color: Colors.deepPurpleAccent.shade200,
        child: Text(
          "CheckBox, Slider Radio and Switch",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  //buildTextFieldUsage button
  Widget buildTextFieldUsage(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, '/GotTextField'),
        color: Colors.cyan.shade300,
        child: Text(
          "TextField Çalışmaları",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  //buildDropDownButtonUsage button
  Widget buildDropDownButtonUsage(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, '/GoDropDownButton'),
        color: Colors.pink.shade200,
        child: Text(
          "DropDownButtonTutorial",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

 Widget buildTimeDateUsage(BuildContext context) {
   return Container(
     child: FlatButton(
       onPressed: () => Navigator.pushNamed(context, '/GoDateTime'),
       color: Colors.amber.shade800,
       child: Text(
         "Date and Time Picker",
         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
       ),
     ),
   );
 }
}
