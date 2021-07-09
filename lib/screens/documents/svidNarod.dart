import 'package:flutter/material.dart';

import '../../global.dart';

class SvidProNarod extends StatelessWidget {
  const SvidProNarod({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*0.95,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 29),
              child: Text(
                "Додати свідотство\nпро народження\nдитини",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Text(
              'Зараз ви можете додати до документів у Дії свідотство про народження своєї дитини. Для цього потрібні серія та номер свідотства.\n\nІнші документи наразі додати неможливо.',
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
                height: 1.5
              )  
            ),
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 27),
              alignment: Alignment.center,
              child: Container(
                height: 50,
                width: 130,
                child: Center(
                  child: Text(
                    'Додати',
                    style: TextStyle(
                      fontSize: 19
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.5
                  )
                ),
              ),
            )
          ]
        )
      )
    );
  }
}