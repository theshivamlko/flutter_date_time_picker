import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main()=>runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedDate;
  String _selectedTime;
  String _selectedDateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Date Time Picker Example"),
      ),
      body:Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(" ${_selectedDate??"Selected Date"}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),),
            RaisedButton(onPressed: ()=>_showDatePicker(),child: Text("Show Date Picker"),),
            Divider(),
            SizedBox(height: 50,),

            Text(" ${_selectedTime??"Selected Time"}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),),
            RaisedButton(onPressed: ()=>_showTimePicker(),child: Text("Show Time Picker"),),
            Divider(),

            SizedBox(height: 50,),

            Text(" ${_selectedDateTime??"Selected Date and Time"}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),),
            RaisedButton(onPressed: ()=>_showDateTimePicker(),child: Text("Show Date and Time Picker"),),
          ],
        ),
      ),
    );
  }
  _showDatePicker()
  {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1980, 1, 1),
        maxTime: DateTime(3000, 12, 31),
        onConfirm: (date) {setState(() {
          _selectedDate=DateFormat("yyyy-MM-dd").format(date);
        });},
        locale: LocaleType.en);
  }

  _showTimePicker()
  {
    DatePicker.showTimePicker(context,
        showTitleActions: true,

        onConfirm: (time) {setState(() {
          _selectedTime=DateFormat("HH:mm:ss").format(time);
        });},
        currentTime: DateTime.now(), locale: LocaleType.en);
}

  _showDateTimePicker()
{
  DatePicker.showDateTimePicker(context,
      showTitleActions: true,
      minTime: DateTime(1980, 1, 1),
  maxTime: DateTime(3000, 12, 31),
onConfirm: (dateTime) {setState(() {
  print(dateTime);
  _selectedDateTime=DateFormat("yyyy-MM-dd  HH-mm-ss").format(dateTime);
});

});
}
}

