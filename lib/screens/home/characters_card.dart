import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/model/character.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';
import 'package:flutter_learning_projects/theme.dart';

import '../profile/profile.dart';


class CharactersCard extends StatelessWidget {
  const CharactersCard({required this.characters, super.key});

  final Character characters;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          children: [

            Image.asset(
              "assets/img/vocations/${characters.vocation.image}",
              width: 100, // adjust to your layout
              height: 100, // adjust to your layout
              fit: BoxFit.cover,
              cacheWidth: 200, // decode at smaller size to reduce memory
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: frame != null
                      ? child
                      : SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              },
            ),
            SizedBox(width: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadlineText(text: characters.name),
                StyledText(text: characters.vocation.title),
              ],
            ),

            Expanded(child: SizedBox()),
            IconButton(onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (ctx) => Profile(character: characters)));
            }, icon: Icon(
              Icons.arrow_forward,
              color: AppColor.textColor,
            ))


          ],
        ),
      ),
    );
  }
}
