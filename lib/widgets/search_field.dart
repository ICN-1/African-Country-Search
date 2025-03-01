import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.hint,
    this.fontSize,
    this.iconSize,
    this.icon,
    required this.controller,
    this.onSearch,
  });

  final String? hint;
  final double? fontSize, iconSize;
  final IconData? icon;
  final TextEditingController controller;
  final void Function(String)? onSearch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        onChanged: onSearch,
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: fontSize ?? 18.0),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
          hintText: hint ?? "Enter text",
          hintStyle: TextStyle(
            fontSize: fontSize ?? 18.0,
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: Icon(icon ?? Icons.sunny, size: iconSize ?? 32.0),
        ),
      ),
    );
  }
}
