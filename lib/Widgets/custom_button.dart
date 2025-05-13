import 'package:flutter/material.dart';

import '../utils/color_manager.dart';
import '../utils/style_manager.dart';


class CustomButton extends StatelessWidget {
  CustomButton({super.key,required this.label ,required this.onClick});

  VoidCallback onClick;
  String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary, // غيّر اللون كما تشاء
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          label,
          style: buttonText1.copyWith(color: ColorManager.white),
        ),
      ),
    );
  }
}