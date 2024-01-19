import 'package:flutter/material.dart';

class AdDetailImgComponent extends StatelessWidget{
  late final String _imageUrl;

  AdDetailImgComponent(this._imageUrl);

  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    return Image.network(
      _imageUrl,
      width: size.width,
    );
  }
}