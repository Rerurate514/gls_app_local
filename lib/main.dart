import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gls_app/Ad/adController.dart';
import 'package:gls_app/Ad/logics/adInfo.dart';

import 'package:gls_app/UserControl/UserController.dart';
import 'package:gls_app/UserControl/logics/UserAuthInfo.dart';
import 'package:gls_app/UserControl/logics/UserProfile.dart';
import 'package:gls_app/components/AD/showAdCom.dart';
import 'package:gls_app/firebase_options.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  final _IMAGE_NAME = "GCG_hGObAAAziDK.jpg";
  Image? _img;
  Text? _text;

  void _login() async {
    final userAuthInfo = UserAuthInfo("rerurateyuto@gmail.com", "rerurate");
    final userProfile = UserProfile(nameArg: "rerurate", birthdayYearArg: 2000, birthdayMonthArg: 2, sexArg: "male");
    final userController = UserController(userAuthInfo, userProfile);

    userController.createUserWithEmailAndPassWord();
    var user = await userController.signInWithEmailAndPassWord();

    userController.addToStore();

    final AdController adController = AdController();
    final imageUrl = await adController.pickImageAndUpload();

    print("$imageUrl");

    AdInfo adInfo = AdInfo(
      createrUid: user, 
      imageUrl: imageUrl, 
      title: "このひとを応援したい", 
      detail: "これはてすと", 
      totalMoneyAmount: 0, 
      targetMoneyAmount: 300000, 
      deadline: DateTime(2024,12,31), 
      targetIdol: "ターゲット人物名", 
      targetPlatform: "X", 
      category: ["IDOL","INTERESTING","CUTE"], 
      hashtag: ["#IDOL","#INTERESTING","#CUTE"], 
      aiderNumbers: 0
    );

    adController.addToStorage(newAdDataArg: adInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(100)),
            AdComponents(
              title: "test", 
              hashtagList: ["da","dad","popular","X"], 
              imageUrl:"https://firebasestorage.googleapis.com/v0/b/fir-test-58395.appspot.com/o/DL%2F2024-01-13_12.07.43.png?alt=media&token=321335a6-2246-46c1-857b-6d95e08abcf9", 
              targetMoneyAmount: 50000, 
              totalMoneyAmount: 20000, 
              aiderNumbers: 16, 
              createrNumbers: 2,
              adTappedCallback: aaaa
            )
          ],
        )
      )
    );
  }

  void aaaa() => print("object");
}
