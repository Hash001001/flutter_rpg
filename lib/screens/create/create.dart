import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/theme.dart';

import '../../shared/text_style.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleText(text: "Character Creation"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [

            Center(
              child: Icon(Icons.code,
              color: AppColor.primaryColor,),
            ),

            HeadlineText(text: "Welcome, New Player."),
            StyledText(text: "Create a name and slogan for your character."),

            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
