// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:reels_video_application/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController songNameController;
  final String labelText;
  final bool isObscure;
  final IconData icon;
  CustomTextField({
    Key? key,
    required this.songNameController,
    required this.labelText,
    this.isObscure = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: songNameController,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(
          icon,
          color: Colors.red,
        ),
        labelStyle: const TextStyle(fontSize: 16, color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      obscureText: isObscure,
    );
  }
}
