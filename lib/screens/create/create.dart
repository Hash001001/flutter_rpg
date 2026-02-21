import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning_projects/model/vocation.dart';
import 'package:flutter_learning_projects/screens/create/vocation_card.dart';
import 'package:flutter_learning_projects/shared/styled_buttons.dart';
import 'package:flutter_learning_projects/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/text_style.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  void submitHandler() {
    if (_nameController.text.trim().isEmpty) {
      print("name must not be empty");
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      print("slogan must not be empty");
      return;
    }

    print(_nameController.text);
    print(_sloganController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(text: "Character Creation"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Icon(Icons.code, color: AppColor.primaryColor)),
          
              HeadlineText(text: "Welcome, New Player."),
              StyledText(text: "Create a name and slogan for your character."),
          
              SizedBox(height: 50),
          
              //name and slogan inout
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColor.textColor,
          
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: Text("Character Name"),
                ),
              ),
          
              SizedBox(height: 20),
          
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColor.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: Text("Character slogan"),
                ),
              ),
          
              //styled button for create character
              SizedBox(height: 30),
          
              Center(child: Icon(Icons.code, color: AppColor.primaryColor)),
          
              HeadlineText(text: "Choose a vocation."),
              StyledText(text: "This determines your available skills."),
          
              SizedBox(height: 20),
          
              VocationCard(vocation: Vocation.junkie),
              VocationCard(vocation: Vocation.ninja),
              VocationCard(vocation: Vocation.raider),
              VocationCard(vocation: Vocation.wizard),
          
              StyledButtons(
                onPressed: submitHandler,
                child: StyledText(text: "Create Character"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
