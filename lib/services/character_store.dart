
import 'package:flutter/material.dart';

import '../model/character.dart';
import '../model/vocation.dart';

class CharacterStore extends ChangeNotifier {

  List<Character> characters = [
    Character(id: '1', name: 'Alice', slogan: 'Code is my weapon!', vocation: Vocation.junkie),
    Character(id: '2', name: 'Bob', slogan: 'I raid terminals for fun.', vocation: Vocation.raider),
    Character(id: '3', name: 'Charlie', slogan: 'UX is my superpower.', vocation: Vocation.ninja),
    Character(id: '4', name: 'Diana', slogan: 'Algorithms are my magic.', vocation: Vocation.wizard),
  ];
}