import 'package:flutter/material.dart';

import '../settingPage.dart';

class DAppBar extends StatelessWidget {
  DAppBar({this.title=''});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(10),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1.5),
              child: GestureDetector(
                onDoubleTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (_)=>SettingVals()
                  ));
                },
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image(image: AssetImage('assets/diya.png'),)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                title, 
                style: TextStyle(
                  fontSize: 18,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}