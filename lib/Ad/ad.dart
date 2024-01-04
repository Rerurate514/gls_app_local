import 'package:cloud_firestore/cloud_firestore.dart';
import 'adInfo.dart';

const Ads_TABLE_COLLECTION_NAME = "ads";

class AdResistry{
  final db = FirebaseFirestore.instance;

  Future add({required AdInfo newAdDataArg}) async{
    await db
      .collection(Ads_TABLE_COLLECTION_NAME)
      .doc(newAdDataArg.adId)
      .set(newAdDataArg.dbProcessedMap);
  }

  Future update({required AdInfo newAdDataArg, required AdTableColumn columnArg}) async{
    await db
      .collection(Ads_TABLE_COLLECTION_NAME)
      .doc(newAdDataArg.adId)
      .update(newAdDataArg.dbProcessedMap);
  }
}

class AdDataFetcher{
  final db = FirebaseFirestore.instance;

  ///Mapデータを取得するときは、取得した変数[AdsTableColumn.カラム名（データベースの項目名）.name]と記述する。
  Future<Map<String, dynamic>> fetch({required String targetadIdArg}) async{
    final fetchedAd = await db
      .collection(Ads_TABLE_COLLECTION_NAME)
      .doc(targetadIdArg)
      .get();

    return fetchedAd.data() ?? {};
  }
}