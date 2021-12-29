import 'package:flutter/material.dart';

class PrimaryFormButton extends StatelessWidget {
  final String label;
  final Function onPressedFunc;

  const PrimaryFormButton({Key? key, required this.label, required this.onPressedFunc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: OutlinedButton(
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(width: 1, color: Colors.white),
          ),
        ),
        onPressed: () {
          onPressedFunc();
        },
      ),
    );
  }
}
