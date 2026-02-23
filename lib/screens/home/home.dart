import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/model/character.dart';
import 'package:flutter_learning_projects/services/character_store.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';
import 'package:provider/provider.dart';
import '../../shared/styled_buttons.dart';
import '../../theme.dart';
import '../create/create.dart';
import 'characters_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryAccent,
      appBar: AppBar(title: TitleText(text: "Your Characters"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                      itemBuilder: (context, index){
                      return CharactersCard(
                        characters:  value.characters[index],
                      );
                  });
                }
              ),
            ),

            SizedBox(height: 20,),
            StyledButtons(onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (ctx) => CreateScreen()));
            }, child: HeadlineText(text: "Create New")),
          ],
        ),
      ),
    );
  }
}
