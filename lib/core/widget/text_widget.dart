import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatefulWidget {
  String text;
  Color? textColor;
  double? fontSize;
  String? fontFamily;
  TextDecoration? textDecoration;
  FontWeight? fontWeight;
  TextOverflow textOverflow;
  TextAlign? textAlign;
  double? lineHeight;
  TextWidget(
      {super.key,
      required this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.textDecoration,
      this.textAlign,
      this.lineHeight,
      this.fontFamily,
      this.textOverflow = TextOverflow.clip});

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: widget.textAlign,
      style: TextStyle(
          color: widget.textColor,
          decoration: widget.textDecoration,
          fontSize: widget.fontSize,
          height: widget.lineHeight ?? null,
          fontFamily: widget.fontFamily,
          fontWeight: widget.fontWeight),
      overflow: widget.textOverflow,
    );
  }
}
