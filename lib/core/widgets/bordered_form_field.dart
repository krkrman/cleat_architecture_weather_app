import 'package:flutter/material.dart';

class BorderedFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;
  final bool isClickable;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validate;
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Color? backgroundColor, textColor;
  final VoidCallback? suffixPressed;
  final GestureTapCallback? onTap;
  final double fontSize;
  final double radius;

  const BorderedFormField({
    required this.controller,
    required this.textInputType,
    this.isPassword = false,
    this.onSubmit,
    this.onChange,
    required this.validate,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.isClickable = true,
    this.onTap,
    this.radius = 4,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 16,
  });

  @override
  State<BorderedFormField> createState() => _BorderedFormFieldState();
}

class _BorderedFormFieldState extends State<BorderedFormField> {
  bool isPasswordShown = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: (widget.isPassword && !isPasswordShown),
      enabled: widget.isClickable,
      onFieldSubmitted: widget.onSubmit,
      onChanged: widget.onChange,
      onTap: widget.onTap,
      validator: widget.validate,
      cursorColor: widget.textColor,
      style: TextStyle(
        fontSize: widget.fontSize,
        color: widget.textColor,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(
          widget.prefixIcon,
        ),
        suffixIcon: IconButton(
          onPressed: widget.isPassword
              ? () {
                  setState(() {
                    isPasswordShown = !isPasswordShown;
                  });
                }
              : widget.suffixPressed,
          icon: widget.isPassword
              ? Icon(isPasswordShown ? Icons.visibility_off : Icons.visibility)
              : Icon(widget.suffixIcon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        ),
      ),
    );
  }
}
