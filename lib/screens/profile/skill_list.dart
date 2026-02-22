import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/model/character.dart';
import 'package:flutter_learning_projects/model/skill.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';
import 'package:flutter_learning_projects/theme.dart';



class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {

  List<Skill> availableSkills = [];
  late Skill selectedSkill;

  @override
  void initState() {
   availableSkills = allSkills.where((skill) => skill.vocation == widget.character.vocation).toList();

   if(widget.character.skills.isEmpty){
     selectedSkill = availableSkills.first;
   }

   if(widget.character.skills.isNotEmpty){
      selectedSkill = widget.character.skills.first;
   }

   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Container(
          padding: EdgeInsetsGeometry.all(16),
          color: AppColor.secondaryColor.withOpacity(0.5),
          child: Column(
            children: [
              HeadlineText(text: "Choose an active skill"),
              StyledText(text: "Skills are unique to your vocation."),
              SizedBox(height: 20,),

              Row(children: availableSkills.map((skill){
                return
                  Expanded(
                    child: Container(
                      color: skill == selectedSkill ? Colors.yellow : Colors.transparent,
                      padding: EdgeInsetsGeometry.all(3),
                      margin: EdgeInsetsGeometry.all(4),
                      child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedSkill = skill;
                              widget.character.updateSkill(skill);
                            });
                          },
                          child: Image.asset("assets/img/skills/${skill.image}", width: 50,))),
                  );
              }).toList()),

              SizedBox(height: 20,),

              StyledText(text: selectedSkill.name),
              
            ],
          ),

        ));
  }
}
