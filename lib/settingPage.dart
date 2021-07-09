import 'package:diya/global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingVals extends StatelessWidget {
  SettingVals();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameC=TextEditingController(text: name),
                          birthDateC=TextEditingController(text: birthDate),
                          photoURLC=TextEditingController(text: photoURL);
    return Scaffold(
      backgroundColor: svidotProNarodColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: nameC,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: birthDateC,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: photoURLC,
            ),
          ),
          ElevatedButton(
            onPressed: ()=>setNames(nameC, birthDateC, photoURLC),
            child: Text('Зберегти',
              style: TextStyle(fontSize: 23),)
          )
        ],
      ),
    );
  }
}

setNames(TextEditingController n, TextEditingController b, TextEditingController p)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', n.text.replaceAll(' ', '\n'));
  await prefs.setString('birth', b.text);
  //await prefs.setString('photo', p.text);
  getNames();
}

getNames()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  name = prefs.getString('name');
  birthDate = prefs.getString('birth');
  //photoURL = prefs.getString('photo');
}