import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Characters"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text("Characters List"),

            FilledButton(onPressed: () {}, child: Text("Click Me.")),
          ],
        ),
      ),
    );
  }
}
