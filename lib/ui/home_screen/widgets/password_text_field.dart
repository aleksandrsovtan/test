import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/assets/colors/app_colors.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.onChanged,
    required this.onTap,
    required this.hidePassword,
    this.hintText,
  });

  final Function(String) onChanged;
  final VoidCallback onTap;
  final bool hidePassword;
  final String? hintText;

  @override
  Widget build(final BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: hidePassword,
      style: GoogleFonts.lato(
        fontSize: 40,
        color: AppColors.black.withOpacity(0.7),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.lato(
          fontSize: 40,
          color: AppColors.black.withOpacity(0.18),
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(31),
            ),
            child: Icon(
              hidePassword ? Icons.visibility : Icons.visibility_off,
              size: 48,
              color: AppColors.black.withOpacity(0.51),
            ),
          ),
        ),
        filled: true,
        fillColor: AppColors.textFieldFillColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(31),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
