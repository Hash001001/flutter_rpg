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

  void toggleFav(){
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill){
    skills.clear();
    skills.add(skill);
  }
}


List<Character> characters = [
  Character(id: '1', name: 'Alice', slogan: 'Code is my weapon!', vocation: Vocation.junkie),
  Character(id: '2', name: 'Bob', slogan: 'I raid terminals for fun.', vocation: Vocation.raider),
  Character(id: '3', name: 'Charlie', slogan: 'UX is my superpower.', vocation: Vocation.ninja),
  Character(id: '4', name: 'Diana', slogan: 'Algorithms are my magic.', vocation: Vocation.wizard),
];