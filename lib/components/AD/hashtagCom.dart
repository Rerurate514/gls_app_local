import 'package:flutter/material.dart';

class HashtagListComponents extends StatelessWidget{
  late final List<String> _hashtags;

  HashtagListComponents(this._hashtags);

  @override
  Widget build(BuildContext context){
    return _HashtagListWidget(_hashtags);
  }

  Widget _HashtagListWidget(List<String> hashtagListArg){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for(String hashtag in hashtagListArg) _HashtagWidget(hashtag),
        ],
      );
  }

  Widget _HashtagWidget(String hashtagArg){
    return Flexible(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              const Icon(Icons.tag),
              Flexible(child: Text(hashtagArg),)
            ],
          ),
        )
      ),
    );
  }
}