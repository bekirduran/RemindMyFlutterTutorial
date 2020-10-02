import 'package:flutter/material.dart';

class TextFieldCalismalari extends StatefulWidget {
  @override
  _TextFieldCalismalariState createState() => _TextFieldCalismalariState();
}

class _TextFieldCalismalariState extends State<TextFieldCalismalari> {
  final formKey = GlobalKey<FormState>(); // it's like a form ID
  String _name, _password, _email; // we use these holding information
  bool autoValidator = false; // :checking is it correct email, name or password

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.cyan.shade300,
          // This part works for color of AppBar
          accentColor: Colors.teal.shade800),
      //This part works for color of FloatingActionButton
      child: Scaffold(
        appBar: AppBar(
          title: Text("TextField Dersleri"),
        ),
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Form(
            key: formKey,
            autovalidate: autoValidator,
            child: ListView(
              children: <Widget>[
                buildStudentNickNameTextFormField(),
                SizedBox(
                  height: 10,
                ),
                buildStudentEmailTextFormField(),
                SizedBox(
                  height: 10,
                ),
                buildStudentPasswordTextFormField(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: _registerTextInputs,
        ),
      ),
    );
  }

//Student Name and surname TextFormField
  Widget buildStudentNickNameTextFormField() {
    return TextFormField(
      onSaved:(value)=> _name = value ,
      validator: (name)=> TextFormValidator._nameValidator(name),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          prefixIcon: GestureDetector(
              onTap: () => print("PrefixIcon Pressed"),
              child: Icon(Icons.account_box)),
          hintText: "Nickname",
          labelText: "Nickname"),
    );
  }

//Student E-mail TextFormField
  Widget buildStudentEmailTextFormField() {
    return TextFormField(
      onSaved:(value)=> _email = value ,
      validator: (mail)=>TextFormValidator._emailValidator(mail),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        prefixIcon: GestureDetector(
            onTap: () => print("PrefixIcon Pressed"),
            child: Icon(Icons.alternate_email)),
        hintText: "abc@gmail.com",
        labelText: "E-mail address",
      ),
    );
  }

  //Student Password TextFormField
  Widget buildStudentPasswordTextFormField() {
    return TextFormField(
      onSaved:(value)=> _password = value ,
      validator: (passw)=>TextFormValidator._passwordValidator(passw),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true, //Invisible entry
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        prefixIcon: GestureDetector(
            onTap: () => print("PrefixIcon Pressed"), child: Icon(Icons.lock)),
        hintText: "Password",
        labelText: "Password",
      ),
    );
  }


  void _registerTextInputs() {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print("Name: $_name and E-mail: $_email and Password: $_password");
    }
    else{
      setState(() {
        autoValidator = true;
      });
    }
  }
}

// This Class using for to Check TextFormField area
class TextFormValidator {
  // Name check
  static String _nameValidator (String name){
    RegExp regex=RegExp("^[a-zA-Z]+\$");
    if (!regex.hasMatch(name))
      return 'Invalid name';
  }
  // E-mail check
  static String _emailValidator (String mail){

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Invalid mail';
  }

  // Password check
  static String _passwordValidator (String passw){

    RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[.:!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(passw))
      return 'Invalid password';
  }


}
