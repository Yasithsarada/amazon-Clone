import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? bgColor;
  final Color? fgrndcColor;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgColor,
    this.fgrndcColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? GLobalVariables.secondaryColor,
        foregroundColor: fgrndcColor ?? Colors.white,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(text),
    );
  }
}
