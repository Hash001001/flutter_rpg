import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/model/vocation.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({super.key, required this.vocation});

  final Vocation vocation;

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(padding: EdgeInsetsGeometry.all(8),
    child: Row(
      children: [
        Image.asset("assets/img/vocations/${vocation.image}",
          width: 80,),
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
    ),));
  }
}
