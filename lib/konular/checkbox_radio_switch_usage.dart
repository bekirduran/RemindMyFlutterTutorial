import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxRadioAndSwitch extends StatefulWidget {
  @override
  _CheckBoxRadioAndSwitchState createState() => _CheckBoxRadioAndSwitchState();
}

class _CheckBoxRadioAndSwitchState extends State<CheckBoxRadioAndSwitch> {
  bool checkBoxStatus = false;
  bool checkBox2Status = false;
  bool switchStatus = false;
  String radioSelected = "";

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.deepPurpleAccent.shade200,
          accentColor: Colors.indigo.shade600),
      child: Scaffold(
        appBar: AppBar(
          title: Text("CheckBox, Slider Radio and Switch"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Text("Please answer the following question."),
              buildCheckBoxUsage(),
              buildCheckBoxUsage2(),
              Text("Please select the your phone OS."),
              buildRadioListTile(),
              buildRadioListTile2(),
              buildSwitchlistTile()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: ()=> print("Saved"),
        ),
      ),
    );
  }

  Widget buildCheckBoxUsage() {
    return CheckboxListTile(
      value: checkBoxStatus,
      onChanged: (newValue) {
        setState(() {
          checkBoxStatus = newValue;
          print(checkBoxStatus);
        });
      },
      title: Text("I'm a Student"),
      subtitle: Text("I'm studying at home"),
      selected: false,
      checkColor: Colors.white,
      activeColor: Colors.green,
      secondary: Text("1-)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }

  Widget buildCheckBoxUsage2() {
    return CheckboxListTile(
      value: checkBox2Status,
      onChanged: (newValue) {
        setState(() {
          checkBox2Status = newValue;
          print(checkBox2Status);
        });
      },
      title: Text("I like computer games"),
      subtitle: Text("Dota2, CounterStrike etc"),
      selected: false,
      checkColor: Colors.white,
      activeColor: Colors.green,
      secondary: Text("2-)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }

  Widget buildRadioListTile() {
    return RadioListTile<String>(
      value: "iOS",
      groupValue: radioSelected,
      onChanged: (newValue) {
        setState(() {
          radioSelected = newValue;
          print(radioSelected);
        });
      },
      title: Text("iOS"),
      subtitle: Text("I'm using Iphone"),
      secondary: Icon(Icons.phone_iphone,color: Colors.cyan),
    );
  }

  Widget buildRadioListTile2() {
    return RadioListTile<String>(
      value: "Android",
      groupValue: radioSelected,
      onChanged: (newValue) {
        setState(() {
          radioSelected = newValue;
          print(radioSelected);
        });
      },
      title: Text("Android"),
      subtitle: Text("I'm using Samsung, Xiaomi"),
      secondary: Icon(Icons.phone_android, color: Colors.red.shade200,),
    );
  }
  
  Widget buildSwitchlistTile(){
    return SwitchListTile(value: switchStatus, onChanged: (newValue){
      setState(() {
        switchStatus = newValue;
        print("Switch result:$switchStatus ");
      });
    },
      title: Text("I approve the survey"),
      secondary: Icon(Icons.content_paste),
    );
  }
  
}
