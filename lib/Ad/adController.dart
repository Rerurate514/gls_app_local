import 'package:gls_app/Ad/logics/adStorage.dart';

import 'logics/adInfo.dart';
import 'logics/adStore.dart';

class AdController{
  final AdResistry _resistry = AdResistry();
  final AdDataFetcher _fetcher = AdDataFetcher();
  final AdImageUploader _uploader = AdImageUploader();

  Future<String> pickImageAndUpload() async {
    final String imageUrl = await _uploader.uploadImageAndFetchUrl() ?? "";
    return imageUrl;
  }

  Future<void> addToStorage({required AdInfo newAdDataArg}) async {
    _resistry.add(newAdData: newAdDataArg);
  }

  Future<void> updateTotalMoneyAmount({required int additionalMoney, required AdInfo existedAdInfo}) async {
    final AdInfo newAdInfo = AdInfo(
      createrUid: existedAdInfo.dbProcessedMap[AdTableColumn.AD_CREATER_UID.name], 
      imageUrl: existedAdInfo.dbProcessedMap[AdTableColumn.AD_IMAGE_URL.name], 
      title: existedAdInfo.dbProcessedMap[AdTableColumn.AD_TITLE.name], 
      detail: existedAdInfo.dbProcessedMap[AdTableColumn.AD_DETAIL.name], 
      totalMoneyAmount: existedAdInfo.dbProcessedMap[AdTableColumn.AD_TOTAL_MONEY_AMOUNT.name] + additionalMoney, 
      targetMoneyAmount: existedAdInfo.dbProcessedMap[AdTableColumn.AD_TARGET_MONEY_AMOUNT.name], 
      deadline: existedAdInfo.dbProcessedMap[AdTableColumn.AD_DEADLINE.name], 
      targetIdol: existedAdInfo.dbProcessedMap[AdTableColumn.AD_TARGET_AIDOL.name], 
      targetPlatform: existedAdInfo.dbProcessedMap[AdTableColumn.AD_TARGET_PLATFORM.name], 
      category: existedAdInfo.dbProcessedMap[AdTableColumn.AD_CATEGORY.name], 
      hashtag: existedAdInfo.dbProcessedMap[AdTableColumn.AD_HASHTAG.name], 
      aiderNumbers: existedAdInfo.dbProcessedMap[AdTableColumn.AD_CREATER_UID.name] + 1
    );

    _resistry.update(newAdData: newAdInfo, column: AdTableColumn.AD_TOTAL_MONEY_AMOUNT);
  }

  Future<void> fetchFromStorage({required String adId}) async {
    _fetcher.fetch(targetAdId: adId);
  }
}