import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/screens/home/home.dart';
import 'package:flutter_learning_projects/services/character_store.dart';
import 'package:flutter_learning_projects/theme.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create: (context) =>  CharacterStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home: Home(),
    ),
  ));
}

