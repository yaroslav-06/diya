import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../../global.dart';

class PlatnPodat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*0.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width*0.95,
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    "Картка платника\nподатків",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('РНОКПП', style: TextStyle(fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    name!,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text('Дата народження:\n'+birthDate!),
                ),
              ],
            )
          ),
          Expanded(child: Container()),
          ValueListenableBuilder(
            valueListenable: curColor,
            builder: (context, ans, child) {
              if(ans==1)
                return MovingLine(
                  text: 'РНОКПП дійсний. Перевірений Державною податковою службою. ',
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(143,240,140,1), Color.fromRGBO(120,210,209,1)]
                  )
                );
              else
                return SizedBox(height: 32);
            }
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 20, left: 16),
            child: Text('3675229346', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),),
          )
        ]
      ),

    );
  }
}

class MovingLine extends StatelessWidget {
  MovingLine({this.text, this.gradient});
  final String? text;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*0.95,
      height: 32,
      decoration: BoxDecoration(gradient: gradient),
      child: Marquee(
        text: text!,
      )
    );
  }
}