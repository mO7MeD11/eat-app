import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscure = false,
    required this.controller,
    this.icon,
    this.validator,
  });

  final String hintText;
  bool obscure;
  final TextEditingController controller;
  final Icon? icon;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isPassword;

  @override
  void initState() {
    isPassword = widget.obscure;
    super.initState();
  }

  void togglePassword() {
    setState(() {
      isPassword = !isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isPassword,

      validator:
          widget.validator ??
          (v) {
            if (v == null || v.isEmpty) {
              return 'value is required';
            }

            return null;
          },
      decoration: InputDecoration(
        suffix: widget.obscure
            ? GestureDetector(
                onTap: togglePassword,
                child: isPassword
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : widget.icon,
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
