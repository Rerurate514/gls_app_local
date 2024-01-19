import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gls_app/components/adDetailFrag/adDetailAiderCom.dart';
import 'package:gls_app/components/adDetailFrag/adDetailBorderCom.dart';
import 'package:gls_app/components/adDetailFrag/adDetailBottomInfoCom.dart';
import 'package:gls_app/components/adDetailFrag/adDetailFooterCom.dart';
import 'package:gls_app/components/adDetailFrag/adDetailImgCom.dart';
import 'package:gls_app/components/adDetailFrag/adDetailTopInfoCom.dart';
import 'package:gls_app/components/adDetailFrag/adDetailTextCom.dart';

class AdDetailFragment extends StatelessWidget{
  late final String _title;
  late final String _adDetail;
  late final List<String> _hashtags;
  late final String _imageUrl;
  late final int _targetMoneyAmount;
  late final int _totalMoneyAmount;
  late final int _aiderNumbers;
  late final int _createrNumbers;
  late final String _creater;
  late final String _platform;
  late final Timestamp _deadLine;
  late final List<String> _aiders;

  AdDetailFragment({
    required String title,
    required String adDetail,
    required List<String> hashtagList,
    required String imageUrl,
    required int targetMoneyAmount,
    required int totalMoneyAmount,
    required int aiderNumbers,
    required int createrNumbers,
    required String creater,
    required String platform,
    required Timestamp deadLine,
    required List<String> aiders
  }){
    _title = title;
    _adDetail = adDetail;
    _hashtags = hashtagList;
    _imageUrl = imageUrl;
    _targetMoneyAmount = targetMoneyAmount;
    _totalMoneyAmount = totalMoneyAmount;
    _aiderNumbers = aiderNumbers;
    _createrNumbers = createrNumbers;
    _creater = creater;
    _platform = platform;
    _deadLine = deadLine;
    _aiders = aiders;
  }

  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          AdDetailImgComponent(_imageUrl),
          Padding(padding: EdgeInsets.symmetric(vertical: size.height * 0.005)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Column(
              children: [
                AdDetailTopInfoComponent(
                  title: "title",
                  hashtagList: ["hashtagList","test","fra"], 
                  targetMoneyAmount: 50000, 
                  totalMoneyAmount: 25000, 
                  aiderNumbers: 3, 
                  createrNumbers: 3, 
                  deadLine: Timestamp.now()
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: size.height * 0.01)),
                AdDetailTextComponent(
                  detailText: _adDetail
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: size.height * 0.01)),
                AdDetailBottomInfoComponent(
                  creater: _creater, 
                  platform: _platform, 
                  deadLine: _deadLine
                ),
                AdDetailBorderComponent(),
                Padding(padding: EdgeInsets.symmetric(vertical: size.height * 0.005)),
                AdDetailAiderComponent(aiders: _aiders),
                Padding(padding: EdgeInsets.symmetric(vertical: size.height * 0.005)),
                AdDetailBorderComponent(),
                AdDetailFooterComponent(),
                Padding(padding: EdgeInsets.symmetric(vertical: size.height * 0.005)),
              ],
            )
          ),
        ],
      ),
    );
  }
}