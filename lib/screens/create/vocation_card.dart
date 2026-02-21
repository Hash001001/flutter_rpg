import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/model/vocation.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';
import 'package:flutter_learning_projects/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({super.key, required this.vocation, required this.onTap,
  required this.selected});

  final Vocation vocation;

  final void Function(Vocation) onTap;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(vocation);
      },
      child: Card(
          color: selected ? AppColor.secondaryColor.withOpacity(0.8) : Colors.transparent,
          child: Padding(padding: EdgeInsetsGeometry.all(8),
      child: Row(
        children: [
          Image.asset("assets/img/vocations/${vocation.image}",
            width: 80,
          colorBlendMode: BlendMode.color,
          color: !selected ? Colors.black.withOpacity(0.9) : Colors.transparent, ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadlineText(text: vocation.title),
                StyledText(text: vocation.description),
              ],
             ),
          ),
        ],
      ),)),
    );
  }
}
