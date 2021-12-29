import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
          letterSpacing: 1.0,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange.shade600,
            width: 2.0,
          )),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.label,
          hintStyle: TextStyle(
              color: const Color(0xFF03071E).withOpacity(0.3),
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              letterSpacing: 1.0),
        ),
      ),
    );
  }
}
