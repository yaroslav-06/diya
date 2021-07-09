import 'package:flutter/material.dart';
import '../../global.dart';

Color getCol(Color st, Color ed, double mid){
  return Color.fromRGBO((st.red*(1-mid)+ed.red*mid).floor(), (st.green*(1-mid)+ed.green*mid).floor(), (st.blue*(1-mid)+ed.blue*mid).floor(), 1);
}

class ColorChan extends StatelessWidget {
  final Widget? child;
  ColorChan({@required this.child});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: changing,
      child: child,
      builder: (context, ans, child){
        if(ans==-10)
          curDocColor=secondaryPagesColor;
        else
          curDocColor=curColorInt<changinColor.length-1 ?getCol(changinColor[curColorInt], changinColor[curColorInt+1], ans) :changinColor[0];
        return Container(
          color: curDocColor,
          child: SafeArea(child: child!),
        );
      }
    );
  }
}