import 'package:flutter/material.dart';

class AdImgComponents extends StatelessWidget{
  late final String _imageUrl;

  AdImgComponents(this._imageUrl);

  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          _imageUrl,
          width: 200,
        ),
      ),
    );
  }
}