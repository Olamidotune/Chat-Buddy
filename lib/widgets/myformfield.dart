import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final String myHintText;

  const MyFormField({
    Key? key,
    required this.myHintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.grey,
        filled: true,
        hintText: myHintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 1,
          ),
        ),
      ),
    );
  }
}
