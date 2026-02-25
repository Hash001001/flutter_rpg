import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/services/firestore_service.dart';

import '../model/character.dart';
import '../model/vocation.dart';

class CharacterStore extends ChangeNotifier {
  List<Character> _characters = [
    /*Character(
      id: '1',
      name: 'Alice',
      slogan: 'Code is my weapon!',
      vocation: Vocation.junkie,
    ),
    Character(
      id: '2',
      name: 'Bob',
      slogan: 'I raid terminals for fun.',
      vocation: Vocation.raider,
    ),
    Character(
      id: '3',
      name: 'Charlie',
      slogan: 'UX is my superpower.',
      vocation: Vocation.ninja,
    ),
    Character(
      id: '4',
      name: 'Diana',
      slogan: 'Algorithms are my magic.',
      vocation: Vocation.wizard,
    ),*/
  ];

  get characters => _characters;

  //add character to the list
  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }


  //update character

  Future<void> updateCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  //remove charcater

  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharcater(character);
    _characters.remove(character);
    notifyListeners();

  }

  //fetch character data once
void fetchCharacterDataOnce() async {
    if(characters.length == 0){
      var snapShot = await FirestoreService.getCharactersOnce();

      for(var doc in snapShot.docs){
        _characters.add(doc.data());
      }
      notifyListeners();
    }
}




}
