import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learning_projects/model/character.dart';

class FirestoreService {
  static final ref = FirebaseFirestore.instance
      .collection('characters')
      .withConverter(
        fromFirestore: Character.fromFireStore,
        toFirestore: (Character c, _) => c.toFireStore(),
      );

  static Future<void> addCharacter(Character character) async {
    await ref.add(character);
  }

  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  }

  static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      'stats': character.statsAsMap,
      'points': character.points,
      'skills': character.skills.map((skill) => skill.id).toList(),
      'isFav': character.isFav,
    });
  }

  //delete character from database

  static Future<void> deleteCharcater(Character character) async {
    await ref.doc(character.id).delete();
  }
}
