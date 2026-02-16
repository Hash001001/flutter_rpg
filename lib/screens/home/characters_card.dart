import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';
import 'package:flutter_learning_projects/theme.dart';


class CharactersCard extends StatelessWidget {
  const CharactersCard({required this.characters, super.key});

  final String characters;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          children: [
            Text(characters),
            Expanded(child: SizedBox()),
            IconButton(onPressed: (){

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
