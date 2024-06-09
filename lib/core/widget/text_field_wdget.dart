import 'package:flutter/material.dart';
import 'package:task_manager_app/core/constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double? borderRadius;
  final int? maxLines;

  const TextFieldWidget({
    Key? key,
    required this.textController,
    required this.hintText,
    this.borderRadius = 30.0,
    this.maxLines = 1,
  }) : super(key: key);

  //inal TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
          )),
    );
  }
}
