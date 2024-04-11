import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:viticareworkers/layouts/homepage.dart';
import 'package:viticareworkers/layouts/login.dart';
import 'package:viticareworkers/layouts/qrscanner.dart';

import 'firebase_options.dart';


late Size mq;
Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'com.error404.viticcareworkers.viticareworkers',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NewLoginPage(),
    );
  }
}
