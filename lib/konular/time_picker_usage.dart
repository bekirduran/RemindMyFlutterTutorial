import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class DateTimePickerUsage extends StatefulWidget {
  @override
  _DateTimePickerUsageState createState() => _DateTimePickerUsageState();
}

class _DateTimePickerUsageState extends State<DateTimePickerUsage> {
  String selectedTime="";
  String selectedDate="";

  @override
  Widget build(BuildContext context) {


    return Theme(
      data: ThemeData(
        primaryColor: Colors.amber.shade800,
        accentColor: Colors.orange.shade900,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Date and Time Picker Tutorial"),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: _buildTime,
                child: Text(
                  "Please select your BirthDay Hour",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(selectedTime, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.orange.shade800),),

              SizedBox(height: 50,),

              GestureDetector(
                onTap: _buildDate,
                child: Text(
                  "Please select your BirthDay",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(selectedDate, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.orange.shade800),),


            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: _registerRecords,
        ),
      ),
    );
  }

  void _registerRecords() {

  }

 _buildDate() {

   DatePicker.showDatePicker(context,
       showTitleActions: true,
       minTime: DateTime(2018, 3, 5),
       maxTime: DateTime(2019, 6, 7), onChanged: (date) {
         print('change $date');
       }, onConfirm: (date) {
        setState(() {
             selectedDate = date.toLocal().toString();
        });
       }, currentTime: DateTime.now(), locale: LocaleType.tr);

 }

 _buildTime() {
   DatePicker.showTime12hPicker(context,showTitleActions: true,
       locale: LocaleType.tr,
       onChanged: (time){
         print(time);
       },
   onConfirm: (time){
     setState(() {
       selectedTime = time.hour.toString() +":"+ time.minute.toString();
     });
   });

 }


}
