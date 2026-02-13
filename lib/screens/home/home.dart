import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/shared/text_style.dart';

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
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            StyledText(text: "Characters List"),
            TitleText(text:
            "Characters List",

            ),
            HeadlineText(text: "Characters List"),
            FilledButton(onPressed: () {}, child: Text("Click Me.")),
          ],
        ),
      ),
    );
  }
}
