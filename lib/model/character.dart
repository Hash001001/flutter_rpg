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
  final Vocation vocation;
  final String id;
  final String name;
  final String slogan;

  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleFav(){
    _isFav = !_isFav;
  }


}