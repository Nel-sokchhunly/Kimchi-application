import 'package:flutter/material.dart';

class SecondaryFormButton extends StatelessWidget {
  final String label;
  final Function onPressedFunc;

  const SecondaryFormButton(
      {Key? key, required this.label, required this.onPressedFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: 14,
        ),
      ),
      onPressed: () {
        onPressedFunc();
      },
    );
  }
}
