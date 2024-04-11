
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../helper/student.dart';
import '../helper/worker.dart';

class APIs {
  static FirebaseAuth auth= FirebaseAuth.instance;
  static late Worker me;
  static FirebaseFirestore firestore= FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

  String? mtoken = " ";

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
        mtoken = token;
    });
  }


  static Future<bool> userExists() async {
    return (await firestore.collection('workers')
        .doc(user.uid)
        .get()).exists;
  }
  static Future<void> createUser(String _currenValue,String _currenValue2) async {

    final chatUser=Worker(id: user.uid,
        Name: user.displayName.toString(), Block: _currenValue2,
        employeeId: _currenValue, creditPoints: '0', onDuty: false);

    return await firestore.collection('workers').doc(user.uid).set(chatUser.toJson());
  }
  static Future<void> getSelfinfo() async {
    await firestore.collection('users')
        .doc(user.uid)
        .get()
        .then((user) async {
      if (user.exists){
        me=Worker.fromJson(user.data()!);
      }});
  }
  // static Future<void> raiseToken() async {
  //   await APIs.getSelfinfo().then((value) async {
  //     final time=DateTime.now().millisecondsSinceEpoch.toString();
  //     final Token token=Token(id:me.id, name: me.Name, roomNo: me.RoomNo, block: me.Block, otp: me.Block,datetime:time.toString()
  //         ,isdone: false);
  //     await firestore.collection('tokens').doc(me.id).collection('active').doc(time).set(token.toJson());
  //   });
  //
  // }
  static Future<void> updateTokenStatus(String id) async{
    log(id);
    await firestore.collection('users').
    doc(id).update({'isRaised' : false,});
    // firestore.collection('tokens').
    // doc(id).collection('active').doc().update({'isdone' : true,});
    log("HJGJGHJGHJVHJVHJVJGKHJ");
  }
  static Stream <QuerySnapshot<Map<String, dynamic>>> getTokenStatus() {
    return firestore.collection('tokens/'+user.uid+'/active/').orderBy('isdone',descending: false).limit(1).snapshots();
  }
}
