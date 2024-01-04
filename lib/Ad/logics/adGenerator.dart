import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'adStore.dart';
import 'adInfo.dart';
import '../../UserControl/UserController.dart';
import '../../UserControl/logics/UserProfile.dart';

const AD_IMAGE_STORAGE = "AD_IMAGE_STORAGE";

class AdGenerator{
  late final String _creater;
  late final String _imageUrl;
  late final String _title;
  late final String _detail;
  final int _totalMoneyAmount = 0;
  late final int _targetMoneyAmount;
  late final Timestamp _deadline;
  late final String _targetIdol;
  late final String _targetPlatform;
  late final List<String> _category;
  late final List<String> _hashtag;
  final int _aiderNumbers = 0;

  Future<AdInfo> generateAdInfo() async {
    AdInfo adInfo = AdInfo(
      creater: _creater, 
      imageUrl: _imageUrl, 
      title: _title, 
      detail: _detail, 
      totalMoneyAmount: _totalMoneyAmount,
      targetMoneyAmount: _targetMoneyAmount, 
      deadline: _deadline, 
      targetIdol: _targetIdol, 
      targetPlatform: _targetPlatform, 
      category: _category, 
      hashtag: _hashtag,
      aiderNumbers: _aiderNumbers,
    );

    return adInfo;
  }

  Future<AdInfo> generateAdInfoWithTotalMoneyAmount({required int updatedTotalMoneyAmount}) async {
    AdInfo adInfo = AdInfo(
      creater: _creater, 
      imageUrl: _imageUrl, 
      title: _title, 
      detail: _detail, 
      totalMoneyAmount: updatedTotalMoneyAmount,
      targetMoneyAmount: _targetMoneyAmount, 
      deadline: _deadline, 
      targetIdol: _targetIdol, 
      targetPlatform: _targetPlatform, 
      category: _category, 
      hashtag: _hashtag,
      aiderNumbers: _aiderNumbers,
    );

    return adInfo;
  }

  Future<AdInfo> generateAdInfoWithAiderNumbers({required int updatedAiderNumbers}) async {
    AdInfo adInfo = AdInfo(
      creater: _creater, 
      imageUrl: _imageUrl, 
      title: _title, 
      detail: _detail, 
      totalMoneyAmount: _totalMoneyAmount,
      targetMoneyAmount: _targetMoneyAmount, 
      deadline: _deadline, 
      targetIdol: _targetIdol, 
      targetPlatform: _targetPlatform, 
      category: _category, 
      hashtag: _hashtag,
      aiderNumbers: updatedAiderNumbers,
    );

    return adInfo;
  }
  
  Future setCreater({required UserController createrArg}) async => _creater = createrArg.profileMap[UserTableColumn.NAME];
  Future setTitle({required String titleArg}) async => _title = titleArg;
  Future setDetail({required String detailArg}) async => _detail = detailArg;
  Future setTargetMoneyAmount({required int targetMoneyAmountArg}) async => _targetMoneyAmount = targetMoneyAmountArg;
  Future setDeadline({required Timestamp deadlineArg}) async => _deadline = deadlineArg;
  Future setTargetIdol({required String targetIdolArg}) async => _targetIdol = targetIdolArg;
  Future setTargetPlatform({required String targetPlatformArg}) async => _targetPlatform = targetPlatformArg;
  Future setCategory({required List<String> categoryArg}) async => _category = categoryArg;
  Future setHashtag({required List<String> hashtagArg}) async => _hashtag = hashtagArg;
   
  Future setImage() async {
    final _StorageController storageController = _StorageController();
    final File? pickedImageFile = await _pickImageFromLocal();

    if(pickedImageFile == null) return;

    _imageUrl = await storageController.uploadAndFetchImageUrl(imageFileArg: pickedImageFile);
  }
  

  Future<File?> _pickImageFromLocal() async {
    final pickerFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickerFile == null) return null;

    File file = File(pickerFile.path);

    return file;
  }
}

class _StorageController{
  final FirebaseStorage _STORAGE = FirebaseStorage.instance;
    
  Future<String> _fetchImageUrlFromFireStorage({required String pathArg}) async {
    String imageUrl = "";

    try{
      Reference imageRef = _STORAGE.ref().child(AD_IMAGE_STORAGE).child(pathArg);
      String imageUrl = await imageRef.getDownloadURL();
    }
    catch(e){
      print(e);
    }

    return imageUrl;
  }

  Future<String> uploadAndFetchImageUrl({required File imageFileArg}) async {
    String uniqueId = imageFileArg.hashCode.toString();
    String fileName = "$AD_IMAGE_STORAGE/$uniqueId-$imageFileArg";

    try{
      await _STORAGE.ref(fileName).putFile(imageFileArg);
    }
    catch(e){
      print(e);
    }

    String imageUrl = await _fetchImageUrlFromFireStorage(pathArg: fileName);
    return imageUrl;
  }
}