import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diya/global.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

setFromFb(String code) async {
  DocumentSnapshot<Map<String, dynamic>> documentSnapshot=await firestore.collection('users').doc(code).get();
  if(documentSnapshot.exists){
    Map<String, dynamic>? docs = documentSnapshot.data();
    print(docs);
    if(docs!['active']){
      name=docs['name'].replaceAll(' ', '\n');
      photoURL=docs['photo'];
      birthDate=docs['birthDate'];
    }
  }
}