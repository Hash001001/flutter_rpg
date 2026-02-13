import 'package:flutter/material.dart';
import 'package:flutter_learning_projects/theme.dart';


class StyledButtons extends StatelessWidget {
  const StyledButtons({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.primaryColor, AppColor.primaryAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      child: TextButton(onPressed: onPressed, child: child),
    );
  }
}
