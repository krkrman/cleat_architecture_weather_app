import 'package:flutter/material.dart';

class BorderLessFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;
  final bool isClickable;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validate;
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final GestureTapCallback? onTap;
  final Color? backgroundColor, textColor;
  final double height;
  final double width;
  final double fontSize;
  final double radius;

  const BorderLessFormField({
    required this.controller,
    required this.textInputType,
    this.isPassword = false,
    this.onSubmit,
    this.onChange,
    required this.validate,
    required this.hint,
    this.height = 50,
    this.prefixIcon,
    this.suffixIcon,
    this.width = double.infinity,
    this.suffixPressed,
    this.isClickable = true,
    this.fontSize = 16,
    this.onTap,
    this.radius = 4,
    this.backgroundColor,
    this.textColor,
  });

  @override
  State<BorderLessFormField> createState() => _BorderLessFormFieldState();
}

class _BorderLessFormFieldState extends State<BorderLessFormField> {
  bool isPasswordShown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.backgroundColor ?? Colors.grey[300]),
      child: Row(
        children: [
          if (widget.prefixIcon != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                widget.prefixIcon,
              ),
            ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.textInputType,
              cursorColor: widget.textColor,
              obscureText: (widget.isPassword && !isPasswordShown),
              enabled: widget.isClickable,
              onFieldSubmitted: widget.onSubmit,
              onChanged: widget.onChange,
              onTap: widget.onTap,
              validator: widget.validate,
              style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.textColor,
              ),
            ),
          ),
          IconButton(
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
          )
        ],
      ),
    );
  }
}
