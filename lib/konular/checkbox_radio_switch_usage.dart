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
  double sliderStatus = 18;
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
              Container(color: Colors.teal.shade200,child: Text("Please select your age : ${sliderStatus.floor()}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              Container(color:Colors.teal.shade100,child: buildSlider()),

              Container(color: Colors.green.shade200,child: Text("Please select the following question.",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              Container(color: Colors.green.shade100,child: buildCheckBoxUsage()),
              Container(color: Colors.green.shade100,child: buildCheckBoxUsage2()),

              Container(color: Colors.lime.shade200,child: Text("Please select the your phone OS.",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              Container(color: Colors.lime.shade100,child: buildRadioListTile()),
              Container(color: Colors.lime.shade100,child: buildRadioListTile2()),
              SizedBox(height: 75,),
              buildSwitchlistTile()
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: switchStatus?true:false, // if approve the survey then this button will be visible
          child: FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: _surveyRegister,
            elevation: 5,

          ),
        )
      ),
    );
  }

// floatingActionButton onPressed func.
  void _surveyRegister(){

    print("1-) User age is : ${sliderStatus.floor().toString()}\n"
        "2-) Is user student: ${checkBoxStatus?"Yes":"No"}\n"
        "3-) Is user like computer games : ${checkBox2Status? "Yes" : "No"}\n"
        "4-) User is using phone OS : $radioSelected \n"
        "5-) Survey is  : ${switchStatus?"APPROVED":"REJECT"}  " );
  }

  // ------------------------------------- CheckBox builder method
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


  // -------------------------------------CheckBox builder method
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


  //------------------------------------- Radio Button builder method

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

  // -------------------------------------Radio Button builder method

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

  //------------------------------------- Switch builder method

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


  //------------------------------------- Slider builder method

  Widget buildSlider(){
    return Slider(value: sliderStatus, onChanged:(newSliderStatus){
      setState(() {
        sliderStatus = newSliderStatus;
        print("Age is : $sliderStatus");
      });
    },
      min: 18,
      max: 65,
      divisions: 47,
      label: sliderStatus.floor().toString(),
    );
  }
  
}
