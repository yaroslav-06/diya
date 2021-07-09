
import 'package:flutter/material.dart';

import '../../global.dart';
import 'pageView.dart';

class NotInternet extends StatelessWidget {
  final int ind;
  NotInternet({this.ind=0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*0.95,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          color: lighter(changinColor[ind], 1/4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 60),
                child: Text(
                  'Коди для перевірки\nне завантажено',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Спробувати іще раз',
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black,
                    width: 2
                  )
                ),
              ),
            ]
          ),
        )
      )
    );
  }
}