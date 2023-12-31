import 'package:cloud_firestore/cloud_firestore.dart';
import 'adInfo.dart';

const ADS_TABLE_COLLECTION_NAME = "ads";

class AdResistry{
  final db = FirebaseFirestore.instance;

  Future add({required AdInfo newAdData}) async{
    await db
      .collection(ADS_TABLE_COLLECTION_NAME)
      .doc(newAdData.adId)
      .set(newAdData.dbProcessedMap);
  }

  Future update({required AdInfo newAdData, required AdTableColumn column}) async{
    await db
      .collection(ADS_TABLE_COLLECTION_NAME)
      .doc(newAdData.adId)
      .update(newAdData.dbProcessedMap);
  }
}

class AdDataFetcher{
  final db = FirebaseFirestore.instance;

  ///Mapデータを取得するときは、取得した変数[AdsTableColumn.カラム名（データベースの項目名）.name]と記述する。
  Future<Map<String, dynamic>> fetch({required String targetAdId}) async{
    final fetchedAd = await db
      .collection(ADS_TABLE_COLLECTION_NAME)
      .doc(targetAdId)
      .get();

    return fetchedAd.data() ?? {};
  }
}