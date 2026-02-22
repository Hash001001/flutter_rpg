import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/model/character.dart';
import 'package:flutter_learning_projects/screens/profile/stats_table.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';
import 'package:flutter_learning_projects/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleText(text: character.name), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //will add different widgets
            Container(
              padding: EdgeInsets.all(16),
              color: AppColor.secondaryColor.withOpacity(0.5),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/vocations/${character.vocation.image}",
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadlineText(text: character.vocation.title),
                        StyledText(text: character.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),

            Center(
              child: Icon(Icons.code, color: AppColor.primaryColor,),
            ),

            Padding(padding: EdgeInsetsGeometry.all(16),
            child: Container(
              color: AppColor.secondaryColor,
              width: double.infinity,
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadlineText(text: "Slogan"),
                  StyledText(text: character.slogan),
                  SizedBox(height: 20,),

                  HeadlineText(text: "Weapon of choice"),
                  StyledText(text: character.vocation.weapon),
                  SizedBox(height: 20,),

                  HeadlineText(text: "Unique Ability"),
                  StyledText(text: character.vocation.ability),
                  SizedBox(height: 20,),
                ],

              ),
            ),
            ),

            //stats table and skills

            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                ],
              ),
            )



            //save button


          ],
        ),
      ),
    );
  }
}
