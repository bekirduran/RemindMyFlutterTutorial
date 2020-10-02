import 'package:flutter/material.dart';

import 'konular/textfield_calismalari.dart';

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
        '/GotextFild' : (context) => TextFieldCalismalari(),
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
          child: Container(
        child: FlatButton(
          onPressed: () => Navigator.pushNamed(context, '/GotextFild'),
          color: Colors.cyan.shade300,
          child: Text(
            "TextFild Çalışmaları",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      )),
    );
  }
}
