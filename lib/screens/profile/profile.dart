import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/model/character.dart';
import 'package:flutter_learning_projects/screens/profile/heart.dart';
import 'package:flutter_learning_projects/screens/profile/skill_list.dart';
import 'package:flutter_learning_projects/screens/profile/stats_table.dart';
import 'package:flutter_learning_projects/services/character_store.dart';
import 'package:flutter_learning_projects/shared/styled_buttons.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';
import 'package:flutter_learning_projects/theme.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryAccent,
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
                  Hero(
                    tag: character.id.toString(),
                    child: Image.asset(
                      "assets/img/vocations/${character.vocation.image}",
                      width: 150,
                      height: 150,
                      // gaplessPlayback: true,
                    ),
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

            SizedBox(height: 20),

            Heart(character: character,),

            Center(child: Icon(Icons.code, color: AppColor.primaryColor)),

            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Container(
                color: AppColor.secondaryColor,
                width: double.infinity,
                padding: EdgeInsetsGeometry.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadlineText(text: "Slogan"),
                    StyledText(text: character.slogan),
                    SizedBox(height: 20),

                    HeadlineText(text: "Weapon of choice"),
                    StyledText(text: character.vocation.weapon),
                    SizedBox(height: 20),

                    HeadlineText(text: "Unique Ability"),
                    StyledText(text: character.vocation.ability),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            //stats table and skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [StatsTable(character), SkillList(character)],
              ),
            ),

            //save button
            StyledButtons(
              onPressed: () {
                Provider.of<CharacterStore>(
                  context,
                  listen: false,
                ).updateCharacter(character);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: StyledText(text: "Character was saved."),
                    duration: Duration(seconds: 2),
                    showCloseIcon: true,
                    backgroundColor: AppColor.secondaryColor,
                  ),
                );
              },
              child: HeadlineText(text: "Save Character"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
