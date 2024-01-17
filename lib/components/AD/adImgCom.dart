import 'package:flutter/material.dart';

class AdImgComponent extends StatelessWidget{
  late final String _imageUrl;

  AdImgComponent(this._imageUrl);

  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          _imageUrl,
          width: size.width * 0.48,
        ),
      ),
    );
  }
}