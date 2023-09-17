import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color colorTitle;
  final Color colorButton;
  final Function()? onTap;

  const CustomButton({
    super.key,
    required this.title,
    required this.colorTitle,
    required this.colorButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: colorTitle,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
