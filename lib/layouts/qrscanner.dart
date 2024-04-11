import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:viticareworkers/api/apis.dart';
import 'package:viticareworkers/layouts/homepage.dart';

import '../helper/student.dart';
import '../helpers/dialogues.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  var k=0;
  @override
  Widget build(BuildContext context) {
    var t=0;
    return Scaffold(
      appBar: AppBar(title: Text('QR Scanner')),
      body: QrCamera(
        qrCodeCallback: (code) {
          //print('QR Code: $code');
          log("kjssj");
          verify(code);

        },
        child: Container(),
      ),

    );
  }
  findValue(dynamic json, String findKey) {
    final data = json.decode(json) as Map<String, String>;
    List<Map<String, String>> items = data['name'] as List<Map<String, String>>;

    for (var item in items) {
        return item[findKey];
    }
    return null; //not found
  }
  void verify(code) {
    //log(code);
    var id=code.toString().substring(5,33);
    log(id);
    if (id=='9jFPqeCziVSzcoM9UQgBtp9TQZE3'){
      if(k==0) {
        _confirmBox_unblock();
      }
      k+=1;
    }
    //APIs.updateTokenStatus(id);
    //print(result);
    // log("fdjkghdkugfkdgdhgkdfd");
    // var encodedString = jsonEncode(code);
    // //log(encodedString);
    // Map<String, String> valueMap = json.decode(encodedString);
    // valueMap.forEach((key, value){
    //   log('key is $key');
    //   log('value is $value ');
    // });
    // log(encodedString);



    // Student student = Student.fromJson(valueMap);
    // log(student.toString());
    // APIs.updateTokenStatus(student);

  }
  void _confirmBox_unblock() {
    showDialog(context: context, builder: (_) =>
        AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          title: Row(children: [
            Icon(Icons.account_circle, color: Colors.green, size: 28,),
            Text(' Job Done!')
          ],),
          content: Text("Job have been successfully done",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),textAlign: TextAlign.left),
          actions: [
            MaterialButton(onPressed: ()  {
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
              Dialogues.showSnackBar(context, "+50 Credits added to worker", Colors.green);
            },
              child: Text('OK',
                style: TextStyle(color: Colors.green, fontSize: 16),),),
          ],
        ));
  }
}
