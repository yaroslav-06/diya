import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Color passportColor = Color.fromRGBO(176,204,236, 1),
      podatkuColor = Color.fromRGBO(232,196,220, 1),
      svidotProNarodColor = Color.fromRGBO(200,220,236, 1),
      secondaryPagesColor = Color.fromRGBO(200,220,236, 1),
      loginScreen = Color.fromRGBO(224,243,255, 1);

List<Color> changinColor=[
  passportColor,
  podatkuColor,
  svidotProNarodColor,
  svidotProNarodColor
];

List<String> pagesIconIm = [
  'doc',
  'services',
  'mess',
  'menu'
];

List<String> textPages = [
  'Документи',
  'Послуги',
  'Повідомлення',
  'Меню'
];

Color curDocColor=passportColor;

List<ValueNotifier<double>> scales=List.generate(
      changinColor.length-1,
      (i)=>ValueNotifier<double>(i==0?1:0.9)
    );

ValueNotifier<double> changing = ValueNotifier(0);
ValueNotifier<int> curColor=ValueNotifier(0);

int curColorInt = 0;

String? name="Name",
        photoURL='',
        birthDate='00.00.0000';

double height=0, width=0;