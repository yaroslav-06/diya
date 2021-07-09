import 'dart:math';

import 'package:diya/global.dart';
import 'package:flutter/material.dart';

import 'notInternet.dart';

Color lighter(Color a, double k){
  return Color.fromRGBO(
    min(255, (a.red+(255-a.red)*k).round()),
    min(255, (a.green+(255-a.green)*k).round()),
    min(255, (a.blue+(255-a.blue)*k).round()),
    1
  );
}

class CPageView extends StatefulWidget {
  CPageView({this.children});
  final List<Widget>? children;
  @override
  _CPageViewState createState() => _CPageViewState();
}

PageController? pwContr;

class _CPageViewState extends State<CPageView> {
  @override
  void initState() {
    pwContr=PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );
    super.initState();
  }
  @override
  void dispose() { 
    pwContr!.dispose();
    super.dispose();
  }
  addLisPage(){
    curColorInt = pwContr!.page!.floor();
    curColor.value = pwContr!.page!.round();
    changing.value = pwContr!.page!-curColorInt;
    scales[curColorInt].value=1-changing.value*0.1;
    if(curColorInt!=changinColor.length-2)
      scales[curColorInt+1].value=0.9+changing.value*0.1;
  }
  @override
  Widget build(BuildContext context) {
    changing.value=0;
    pwContr!.addListener(addLisPage);
    return PageView(
      physics: BouncingScrollPhysics(),
      controller: pwContr,
      children: List.generate(changinColor.length-1, (i){
        return Center(
          child: CMatrixTransition(
            back: PassCard(
              child: NotInternet(ind: i,),
              scaleCh: scales[i]
            ),
            front: PassCard(
              child: widget.children![i],
              scaleCh: scales[i]
            )
          ),
        );
      }),
    );
  }
}

class CMatrixTransition extends StatefulWidget {
  final Widget? front, back;
  final Duration dur;
  CMatrixTransition({@required this.front,@required this.back, this.dur=const Duration(milliseconds: 16*600)});
  @override
  _MatrixTransitionState createState() => _MatrixTransitionState();
}

class _MatrixTransitionState extends State<CMatrixTransition> with SingleTickerProviderStateMixin {
  AnimationController? anC;
  bool side=true;
  @override
  void initState() {
    anC=AnimationController(
      vsync: this,
      duration: widget.dur,
      reverseDuration: widget.dur,
      upperBound: 16
    );
    super.initState();
  }
  @override
  void dispose() {
    anC!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        anC!.animateTo(anC!.value+1);
      },
      child: AnimatedBuilder(
        animation: anC!,
        builder: (context, child){
          side=anC!.value.round()%2==0;
          return Center(
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(2, 3, 0.001)
                ..rotateY(anC!.value*pi),
              alignment: Alignment.center,
              child: side
                ?widget.front
                :Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(pi),
                  child: widget.back
                ),
            ),
          );
        }
      ),
    );
  }
}

class PassCard extends StatelessWidget {
  final Widget? child;
  final ValueNotifier<double>? scaleCh;
  PassCard({this.child, this.scaleCh});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: scaleCh!,
      builder: (context, x, child) {
        return Transform.scale(
          scale: x,
          child: child
        );
      },
      child: ValueListenableBuilder<double>(
        valueListenable: changing,
        child: child,
        builder: (context, ans, child) {
          return Container(
            height: width*0.3*3.9,
            width: width*0.95,
            decoration: BoxDecoration(
              color: lighter(curDocColor, 0.5),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: -10,
                  blurRadius: 7,
                  offset: Offset(0, 25),
                ),
              ],
            ),
            child: child
          );
        }
      ),
    );
  }
}