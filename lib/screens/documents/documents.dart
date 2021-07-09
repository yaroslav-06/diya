import 'package:flutter/material.dart';

import 'pageView.dart';
import '../../global.dart';
import 'passport.dart';
import 'platnukaPodatkiv.dart';
import 'svidNarod.dart';

DateTime nowDaTi=DateTime.now();

class Documents extends StatelessWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(flex: 3,child: Container()),
          Container(
            child: CPageView(
              children: [
                Passport(),
                PlatnPodat(),
                SvidProNarod()
              ],
            ),
            height: 1.25*width,
          ),
          Expanded(flex: 3,child: Container(color: Colors.transparent,)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Дані оновлено '+
                nowDaTi.day.toString().padLeft(2,'0')+'.'+
                nowDaTi.month.toString().padLeft(2,'0')+'.'+
                '${nowDaTi.year} о 10:23',
                style: TextStyle(
                  fontWeight: FontWeight.w500
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: curColor,
                builder: (context, ans, child){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(changinColor.length-1, (index){
                      return Container(
                        height: 8,
                        width: 8,
                        margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                        decoration: BoxDecoration(
                          color: index==ans?Colors.black:Colors.black26,
                          borderRadius: BorderRadius.circular(4)
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
          Expanded(flex: 1,child: Container(),)
        ],
      ),
    );
  }
}