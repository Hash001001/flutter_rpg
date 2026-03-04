import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/model/character.dart';
import 'package:flutter_learning_projects/theme.dart';

class Heart extends StatefulWidget {
  const Heart({super.key, required this.character});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 45), weight: 50),

      TweenSequenceItem<double>(tween: Tween(begin: 45, end: 25), weight: 50),
    ]).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return IconButton(
          onPressed: () {
            _controller.reset();
            _controller.forward();
            widget.character.toggleFav();
          },
          icon: Icon(
            Icons.favorite,
            color: widget.character.isFav ? AppColor.primaryColor : Colors.grey[800],
            size: _sizeAnimation.value,
          ),
        );
      }
    );
  }
}
