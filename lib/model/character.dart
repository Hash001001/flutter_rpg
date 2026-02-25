import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learning_projects/model/skill.dart';
import 'package:flutter_learning_projects/model/stats.dart';
import 'package:flutter_learning_projects/model/vocation.dart';

class Character with Stats {
  //constructor
  Character({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
  });

  //Fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String id;
  final String name;
  final String slogan;

  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((skill) => skill.id).toList(),
      'stats': statsAsMap,
      'points': points,
    };
  }

  factory Character.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    Character character = Character(
      id: snapshot.id,
      name: data['name'],
      slogan: data['slogan'],
      vocation: Vocation.values.firstWhere(
        (v) => v.toString() == data['vocation'],
      ),
    );

    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((skill) => skill.id == id);
      character.updateSkill(skill);
    }

    if (data['isFav'] == true) {
      character.toggleFav();
    }

    //assign stats and points
    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}

List<Character> characters = [
  Character(
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
  ),
];
