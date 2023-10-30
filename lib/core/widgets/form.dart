import 'package:chef_app_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Form extends StatelessWidget {
  const Form({
    Key? key,
    this.hint,
    this.validate,
    this.label,
    this.icon,
    this.suffixIconOnpressed,
    required this.controller,
    this.isVis = false,
  }) : super(key: key);

  final String? hint;
  final String? Function(String?)? validate;
  final String? label;
  final IconData? icon;
  final VoidCallback? suffixIconOnpressed;
  final TextEditingController controller;

  final bool isVis;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primary,
      validator: validate,
      obscureText: isVis,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: label,
          hintText: hint,
          suffixIcon:
              IconButton(onPressed: suffixIconOnpressed, icon: Icon(icon))),
    );
  }
}
