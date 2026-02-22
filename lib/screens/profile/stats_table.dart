import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/model/character.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';
import 'package:flutter_learning_projects/theme.dart';


class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            color: AppColor.secondaryColor,
            padding: EdgeInsetsGeometry.all(8),
            child: Row(
              children: [
                Icon(Icons.star,
                color: widget.character.points > 0 ? Colors.yellow : Colors.grey,),
                SizedBox(width: 20,),
                StyledText(text: "Stat points availble:"),
                Expanded(child: SizedBox(width: 20,)),
                HeadlineText(text: widget.character.points.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
