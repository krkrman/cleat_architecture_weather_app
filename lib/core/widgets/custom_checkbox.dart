import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  double scale;
  bool isChecked;
  Color borderColor;
  Color checkColor;
  Color? activeColor;
  Function onChanged;

  CustomCheckbox({
    Key? key,
    this.scale = 1.3,
    this.isChecked = false,
    this.borderColor = Colors.grey,
    this.checkColor = Colors.white,
    this.activeColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.scale,
      child: Checkbox(
        value: widget.isChecked,
        side: BorderSide(
          color: widget.borderColor,
        ),
        checkColor: Colors.white,
        activeColor: widget.activeColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
        onChanged: (value) {
          setState(() {
            debugPrint(value.toString());
            widget.isChecked = value!;
            widget.onChanged();
          });

        },
      ),
    );
  }
}
