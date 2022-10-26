import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final Color? renk;
  final Widget? child;
  final void Function()? onPress;

  MyWidget({this.renk = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        decoration: BoxDecoration(
          color: renk,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(12.0),
      ),
    );
  }
}
