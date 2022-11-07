import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Button extends StatefulWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color backgroundColor;
  final double elevation;

  const Button({
    required this.child,
    required this.onPressed,
    this.backgroundColor = kgreenColor,
    this.elevation = 5.0,
    Key? key,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
          elevation: MaterialStateProperty.all(5),
          shadowColor: MaterialStateProperty.all(kgreenColor),
        ),
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
