import 'package:flutter/material.dart';

import '../../scaffold/appBar.dart';
import '../../global.dart';
import '../documents/documents.dart';

class MainS extends StatefulWidget {
  @override
  _MainSState createState() => _MainSState();
}

int curPage=0;

class _MainSState extends State<MainS> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DAppBar(
          title: curPage==0
            ?""
          :curPage==1
            ?"Послуги"
          :curPage==2
            ?"Повідомлення"
            :"Вітаємо,\nЯрослав",
        ),
        Expanded(
          child: curPage==0
            ?Documents()
          :curPage==1
            ?Container()//Services()
          :curPage==2
            ?Container()//Messages()
            :Container()//Menu()
        ),
        Padding(
          padding: EdgeInsets.only(left:4, right: 4, bottom: 4),
          child: BottomNavigationBar(
            currentIndex: curPage,
            onTap: (i)=>setState((){
              curPage=i;
              if(curPage==0){
                curColor.value=0;
                curColorInt=0;
                changing.value=0;
              }
              else
                changing.value=-10;
            }),
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            elevation: 0,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            type: BottomNavigationBarType.fixed,
            items: List.generate(4, (i){
              return BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('assets/'+pagesIconIm[i]+'Off.png'),
                  height: 30,
                  width: 30,
                ),
                label: textPages[i],
                activeIcon: Image(
                  image: AssetImage('assets/'+pagesIconIm[i]+'On.png'),
                  height: 30,
                  width: 30,
                )
              );
            })
          ),
        )
      ],
    );
  }
}