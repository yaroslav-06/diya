import 'package:flutter/material.dart';

import '../../global.dart';

class Passport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * 0.95,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 22.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width * 0.95,
                padding: EdgeInsets.symmetric(vertical: width / 13.3),
                child: Text(
                  "Паспорт громадянина\nУкраїни <тризуб>",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: 3 / 4,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(photoURL!),
                                    fit: BoxFit.cover),
                                border:
                                    Border.all(width: 2, color: passportColor)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //height: (width*0.95/2-39)/3*4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: width / 180,
                                  horizontal: width / 22.5),
                              child: Text('Дата\nнародження:\n' + birthDate!),
                            ),
                            Padding(
                              padding: EdgeInsets.all(width / 22.5),
                              child: Text('Номер:\n005482371'),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 2,
                  width: width * 0.95,
                  margin: EdgeInsets.only(top: width * 29 / 360),
                  color: passportColor),
              Container(
                height: width * 0.95 / 3,
                padding: EdgeInsets.only(top: width / 30),
                alignment: Alignment.topLeft,
                child: Text(
                  name!,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ));
  }
}
