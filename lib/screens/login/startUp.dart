import 'dart:math';

import 'package:flutter/material.dart';
import '../colors/mainS.dart';
import '../colors/colors.dart';
import '../../global.dart';
import '../../firebaseFunc/getFromCode.dart';

class StartUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> code=ValueNotifier(''); 
    return Container(
      height: height,
      width: width,
      color: svidotProNarodColor,
      child: Column(
        children: [
          Expanded(flex: 1,child: Container()),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Код для входу',
                    style: TextStyle(
                      fontSize: 28
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ValueListenableBuilder<String>(
                    valueListenable: code,
                    builder: (_, ans, __){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          4,
                          (i){
                            return Container(
                              height: 10,
                              width: 10,
                              margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 2.1),
                                color: ans.length>i?Colors.black:Colors.transparent,
                                borderRadius: BorderRadius.circular(5)
                              ),
                            );
                          }),
                      );
                    },
                  )
                ),
              ],
            ),
          ),
          Numpad(code: code),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "Не пам'ятаю код для входу",
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Numpad extends StatelessWidget {
  final ValueNotifier<String> code;
  Numpad({required this.code});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 35, right: 35),
      child: Column(
        children: List.generate(
          3,
          (i){
          return Row(
            children: List.generate(
            3,
            (j) => NumBotton(
              code: code,
              keyB: (i*3+j+1).toString()
            )),
          );})+
          [
            Row(
              children: [
                Container(width: (width-70)/3),
                NumBotton(code: code, keyB: '0'),
                NumBotton(code: code, keyB: 'erase')
              ]
            )
          ],
      ),
    );
  }
}

class NumBotton extends StatefulWidget {
  final ValueNotifier<String> code;
  final String keyB;
  NumBotton({required this.code, required this.keyB});
  @override
  _NumBottonState createState() => _NumBottonState();
}

class _NumBottonState extends State<NumBotton> {
  bool pressed=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTapDown: (e){
          setState(() {
            pressed=true;
          });
        },
        onTapCancel: ()async{
          await Future.delayed(Duration(milliseconds: 30));
          setState(() {
            pressed=false;
          });
        },
        onTap: ()async{
          await Future.delayed(Duration(milliseconds: 30));
          if(widget.code.value.length!=4)
            setState(() {
              pressed=false;
              if(widget.keyB=='erase')
                widget.code.value=widget.code.value.substring(0, widget.code.value.length-1);
              else{
                widget.code.value=widget.code.value+widget.keyB;
            }});
          if(widget.code.value.length==4){
            await setFromFb(widget.code.value);
            await Navigator.push(context,
              MaterialPageRoute(
                builder: (context){
                  return Scaffold(
                    body: ColorChan(
                      child: MainS()
                    ),
                  );
                }
              )
            );
          }
        },
        child: Container(
          width: (width-70)/3-16,
          height: (width-70)/3-16,
          decoration: BoxDecoration(
            color: pressed?Colors.black:Colors.transparent,
            border: widget.keyB=='erase'?null:Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular((width-70)/6-8)
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: widget.keyB=='erase'
                ?Transform.rotate(angle: pi/4,child: Icon(Icons.add,
                    color: pressed?loginScreen:Colors.black, size: 45))
                :Text(widget.keyB,
                  style: TextStyle(
                    color: pressed?loginScreen:Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w100
                  ),)
            ),
          )
        ),
      ),
    );
  }
}