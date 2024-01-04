import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "api key here",
      appId: "app id here",
      messagingSenderId: "messaging id",
      projectId: "fir-test-58395",
    ),
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

  Future<void> _download() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference imageRef = storage.ref().child("DL").child(_IMAGE_NAME);
    
    String imageUrl = await imageRef.getDownloadURL();

    print("image = " + imageUrl);

    // Reference textRef = storage.ref("DL");
    // var data = await textRef.getData();

    setState(() {
      _img = Image.network(imageUrl);
      // _text = Text(ascii.decode(data!));
    });

    Directory appDocDir = await getApplicationCacheDirectory();
    File downloadToFile = File("${appDocDir.path}/download-${_IMAGE_NAME}");

    try{
      await imageRef.writeToFile(downloadToFile);
    }
    catch(e){
      print(e);
    }
  }

  void _upload() async {
    final pickerFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickerFile == null) return;

    File file = File(pickerFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    try{
      await storage.ref("UL/upload-pic.png").putFile(file);
      setState(() {
        _img = null;
        _text  = const Text("UploadDone");
      });
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(_img != null) _img!,
            if(_text != null) _text!,
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _download,
            child: const Icon(Icons.download_outlined),
          ),
          FloatingActionButton(
            onPressed: _upload,
            child: const Icon(Icons.upload_outlined),
          ),
        ],
      ),
    );
  }
}
    