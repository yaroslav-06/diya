import 'package:diya/global.dart';
import 'package:diya/screens/login/startUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дія',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'E Ukraine'
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

/*
final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyAwesomeApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
} */

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    setSizes(context);
    return Scaffold(
        body: StartUpPage()
    );
  }
}

setSizes(context){
  Size size=MediaQuery.of(context).size;
  //EdgeInsets pad=MediaQuery.of(context).padding;
  height=size.height;//-pad.vertical;
  width=size.width;//-pad.horizontal;
}