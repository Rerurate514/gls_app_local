import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gls_app/components/adDetailFrag/adDetailFrag.dart';
import 'package:gls_app/firebase_options.dart';

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
  var  title =  "広告詳細コンポーネント";
  var  hashtagList = ["hashtagList","test","fra"];
  var  imageUrl = "https://firebasestorage.googleapis.com/v0/b/fir-test-58395.appspot.com/o/DL%2F2024-01-13_12.07.43.png?alt=media&token=321335a6-2246-46c1-857b-6d95e08abcf9";
  var  targetMoneyAmount = 50000;
  var  totalMoneyAmount = 25000;
  var  aiderNumbers = 3;
  var  createrNumbers =3;
  var  creater = "くまぎゆううううううよｐ";
  var  deadLine = Timestamp.now();
  var  platform = "Twitter";
  var  adDetail = "fwaeihfiueh vfnuewhvf8iwefuiewvh uiawehf ubwaegfv u7iguyiwegfyuewg vuiewgf viunewfvwea9hfvuierwauo8 bevwhoivf wabio;fioezyg8n rugiu orzdovi jrziov raiunv";
  var  aiders = [""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AdDetailFragment(
        title: title,
        adDetail: adDetail, 
        hashtagList: hashtagList, 
        imageUrl: imageUrl, 
        targetMoneyAmount: targetMoneyAmount, 
        totalMoneyAmount: totalMoneyAmount, 
        aiderNumbers: aiderNumbers, 
        createrNumbers: createrNumbers,
        creater: creater, 
        platform: platform,
        deadLine: deadLine,
        aiders: aiders,
      )
    );
  }

  void aaaa() => print("object");
}

// class _MyHomePageState extends State<MyHomePage> {



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Center(
//         child: Column(
//           children: [
//             Padding(padding: EdgeInsets.all(100)),
//             AdComponents(
//               title: "test", 
//               hashtagList: ["da","dad","popular","X"], 
//               imageUrl:"https://firebasestorage.googleapis.com/v0/b/fir-test-58395.appspot.com/o/DL%2F2024-01-13_12.07.43.png?alt=media&token=321335a6-2246-46c1-857b-6d95e08abcf9", 
//               targetMoneyAmount: 50000, 
//               totalMoneyAmount: 20000, 
//               aiderNumbers: 16, 
//               createrNumbers: 2,
//               adTappedCallback: aaaa
//             )
//           ],
//         )
//       )
//     );
//   }

//   void aaaa() => print("object");
// }
