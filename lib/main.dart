import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/screens/home/home.dart';
import 'package:flutter_learning_projects/services/character_store.dart';
import 'package:flutter_learning_projects/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) =>  CharacterStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home: Home(),
    ),
  ));
}

