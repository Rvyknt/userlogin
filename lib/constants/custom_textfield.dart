import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  String? selectedOption;

  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: (){
          // Set the selectedOption when the user taps on the text field
          selectedOption = selectedOption;
          if (kDebugMode) {
            print('$selectedOption');
          }
        },
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              // borderRadius: BorderRadius.circular(radius)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ),
      ),
    );
  }
}
