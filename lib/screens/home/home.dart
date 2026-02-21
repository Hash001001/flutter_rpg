import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/model/character.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';
import 'package:flutter_learning_projects/theme.dart';

import '../../shared/styled_buttons.dart';
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
      appBar: AppBar(title: TitleText(text: "Your Characters"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                  itemBuilder: (context, index){
                  return CharactersCard(
                    characters:  characters[index],
                  );
              }),
            ),

            SizedBox(height: 20,),

            StyledButtons(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => Create()));
            }, child: HeadlineText(text: "Create New")),
          ],
        ),
      ),
    );
  }
}
