import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  @override
  String text;
  Color? backgroundColor;
  Color? textColor;
  Color? borderColor;
  FontWeight? fontWeight;
  double? witdh;
  double height;
  double? fontSize;
  String? fontFamily;
  GestureTapCallback? ontap;
  ButtonCustom(
      {required this.text,
      this.ontap,
      this.backgroundColor,
      this.textColor,
      this.borderColor,
      this.fontFamily,
      this.height = 50,
      this.fontSize = 18,
      this.fontWeight,
      this.witdh});
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: 50,
          width: witdh,
          decoration: backgroundColor == null
              ? BoxDecoration(
                  color: backgroundColor,
                  gradient: const LinearGradient(colors: [
                    Color(0xFF02BAC6),
                    Color(0xFF4964E5),
                  ]),
                  borderRadius: const BorderRadius.all(Radius.circular(13.0)),
                )
              : BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(
                    width: 1,
                    color: borderColor!,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(13.0)),
                ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: fontWeight,
                  fontFamily: fontFamily),
            ),
          )),
    );
  }
}
