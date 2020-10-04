import 'dart:math';

import 'package:flutter/material.dart';

class DropDownButtonTutorial extends StatefulWidget {
  @override
  _DropDownButtonTutorialState createState() => _DropDownButtonTutorialState();
}

class _DropDownButtonTutorialState extends State<DropDownButtonTutorial> {
  String selectedColor = "Grey";
  String selectedGender = "Male";
  String selectedFreeTime = "Reading Book";
  String selectedFilmCat = "Action";
  String selectedCountry = "Switzerland";
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.pink.shade200,
        accentColor: Colors.red.shade400,
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text("DropDownButton Tutorial"),
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                Text(
                  "Please select your best colors of the given list",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buildDropDownButtonColors(),

                Text(
                  "Please select your gender",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buildDropDownButtonGender(),

                Text(
                  "Please select your best activity",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buildDropDownButtonFreeTime(),

                Text(
                  "Please select your best film category from giving list",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buildDropDownButtonFilmCategory(),

                Text(
                  "Please select your best country from given list",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buildDropDownButtonCountry()
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

  var gender = ["Male", "Female", "Other"];
  var freeTime = [
    "Reading Book",
    "Watching TV",
    "Jogging",
    "Sleeping",
    "Cooking",
    "Swimming",
    "Meeting Friends"
  ];
  var favColor = [
    "Red",
    "Green",
    "Blue",
    "White",
    "Black",
    "Yellow",
    "Purple",
    "Grey"
  ];
  var favFilmCategory = [
    "Action",
    "Adventure",
    "Comedy",
    "Crime",
    "Drama",
    "Fantasy",
    "Historical",
    "Horror"
  ];
  var favCountry = [
    "Switzerland",
    "Canada",
    "Japan",
    "Germany",
    "Australia",
    "United Kingdom",
    "United States",
    "Sweden"
  ];

  Widget buildDropDownButtonColors() {
    return DropdownButton<String>(
      items: favColor.map((listItem) {
        return DropdownMenuItem<String>(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 20,
                width: 20,
                color: _buildColor(listItem),
              ),
              Text(listItem)
            ],
          ),
          value: listItem,
        );
      }).toList(),
      onChanged: (selection) {
        setState(() {
          selectedColor = selection;
        });
      },
      icon: Icon(
        Icons.color_lens,
        color: _buildColor(selectedColor),
      ),
      value: selectedColor,
    );

  }
  Widget buildDropDownButtonGender() {

    return DropdownButton<String>(items: gender.map((item) {
      return DropdownMenuItem<String>(child:Text(item),value: item,);
    }).toList()
     , onChanged: (selection){
      setState(() {
        selectedGender = selection;
      });
        },
      icon: _buildIcon(selectedGender),
      value: selectedGender,
        );

  }

  Widget buildDropDownButtonFreeTime() {
    return DropdownButton<String>(items: freeTime.map((item) {
      return DropdownMenuItem<String>(child: Row(
        children: <Widget>[
          _iconBuilder(item),
          SizedBox(width: 50,),
          Text(item),
        ],
      ),value: item,);
    }).toList()
      , onChanged: (selection){
        setState(() {
          selectedFreeTime = selection;
        });
      },
      value: selectedFreeTime,
    );
  }

  Widget buildDropDownButtonFilmCategory() {

    return DropdownButton<String>(items: favFilmCategory.map((item) {
      return DropdownMenuItem<String>(child:Text(item),value: item,);
    }).toList()
      , onChanged: (selection){
        setState(() {
          selectedFilmCat = selection;
        });
      },

      value: selectedFilmCat,
    );

  }

  Widget buildDropDownButtonCountry() {
    return DropdownButton<String>(items: favCountry.map((item) {
      return DropdownMenuItem<String>(child:Text(item),value: item,);
    }).toList()
      , onChanged: (selection){
        setState(() {
          selectedCountry = selection;
        });
      },

      value: selectedCountry,
    );
  }


  Color _buildColor(String e) {
    switch (e.toLowerCase()) {
      case "red":
        return Colors.red;
      case "green":
        return Colors.green;
      case "blue":
        return Colors.blue;
      case "white":
        return Colors.white;
      case "black":
        return Colors.black;
      case "purple":
        return Colors.purple;
      case "grey":
        return Colors.grey;
      case "yellow":
        return Colors.yellow;
      default:
        break;
    }
    return Colors.white;
  }

 Icon _buildIcon(String selectedGender) {
    if (selectedGender == "Male"){
      return Icon(Icons.person,color: Colors.blue,);
    }
    else if (selectedGender == "Female"){
      return Icon(Icons.pregnant_woman,color: Colors.pinkAccent,);
    }
  return Icon(Icons.grade,color: Colors.teal,);
 }

 Widget _iconBuilder(String selectedFreeTime) {
    switch (selectedFreeTime){
      case "Reading Book": return Icon(Icons.chrome_reader_mode);
      case "Watching TV": return Icon(Icons.tv);
      case "Jogging": return Icon(Icons.directions_run);
      case "Sleeping": return Icon(Icons.airline_seat_flat);
      case "Cooking": return Icon(Icons.restaurant_menu);
      case "Swimming": return Icon(Icons.pool);
      case "Meeting Friends": return Icon(Icons.people);
      default: break;
    }
    return Icon(Icons.not_interested);
  }



  void _registerRecords() {
    print("1-) User favorite Color is : $selectedColor \n"
        "2-) User gender is : $selectedGender \n"
        "3-) User favorite activity : $selectedFreeTime\n"
        "4-) User favorite film category : $selectedFilmCat\n"
        "5-) User favorite country : $selectedCountry");
  }
}
