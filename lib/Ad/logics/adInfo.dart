import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

enum AdTableColumn{
  AD_CREATER_UID,
  AD_IMAGE_URL,
  AD_TITLE,
  AD_DETAIL,
  AD_TARGET_MONEY_AMOUNT,
  AD_TOTAL_MONEY_AMOUNT,
  AD_DEADLINE,
  AD_TARGET_AIDOL,
  AD_TARGET_PLATFORM,
  AD_CATEGORY,
  AD_HASHTAG,
  AD_AIDER_NUMBERS,
  AD_CREATED,
}

class AdInfo{
  late final String _adId;

  late final String _createrUid;
  late final String _imageUrl;
  late final String _title;
  late final String _detail;
  late final int _targetMoneyAmount;
  late final int _totalMoneyAmount;
  late final Timestamp _deadline;
  late final String _targetIdol;
  late final String _targetPlatform;
  late final String _category;
  late final String _hashtag;
  late final int _aiderNumbers;
  late final Timestamp _created;

  late Map<String, dynamic> _dbProcessedMap;

  String get adId => _adId;
  Map<String, dynamic> get dbProcessedMap => _dbProcessedMap; 

  AdInfo({
    required String createrUid,
    required String imageUrl,
    required String title,
    required String detail,
    required int totalMoneyAmount,
    required int targetMoneyAmount,
    required DateTime deadline,
    required String targetIdol,
    required String targetPlatform,
    required List<String> category,
    required List<String> hashtag,
    required int aiderNumbers
  }){
    _createrUid = createrUid;
    _imageUrl = imageUrl;
    _title = title;
    _detail = detail;
    _totalMoneyAmount = totalMoneyAmount;
    _targetMoneyAmount = targetMoneyAmount;
    _deadline = Timestamp.fromDate(deadline);
    _targetIdol = targetIdol;
    _targetPlatform = targetPlatform;
    _category = category.join(",");
    _hashtag = hashtag.join(",");
    _aiderNumbers = aiderNumbers;

    _created = Timestamp.now();

    _adId = "$_createrUid:$_title:${_created.toString()}";

    _dbProcessedMap = _createDbProcessedMap();
  } 

  Map<String, dynamic> _createDbProcessedMap(){
    return {
      AdTableColumn.AD_CREATER_UID.name:_createrUid,
      AdTableColumn.AD_IMAGE_URL.name:_imageUrl,
      AdTableColumn.AD_TITLE.name:_title,
      AdTableColumn.AD_DETAIL.name:_detail,
      AdTableColumn.AD_TARGET_MONEY_AMOUNT.name:_targetMoneyAmount,
      AdTableColumn.AD_TOTAL_MONEY_AMOUNT.name:_totalMoneyAmount,
      AdTableColumn.AD_DEADLINE.name:_deadline,
      AdTableColumn.AD_TARGET_AIDOL.name:_targetIdol,
      AdTableColumn.AD_TARGET_PLATFORM.name:_targetPlatform,
      AdTableColumn.AD_CATEGORY.name:_category,
      AdTableColumn.AD_HASHTAG.name:_hashtag,
      AdTableColumn.AD_AIDER_NUMBERS.name:_aiderNumbers,
      AdTableColumn.AD_CREATED.name:_created,
    };
  }
}