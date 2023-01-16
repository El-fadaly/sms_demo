import 'package:flutter/material.dart';
import 'package:sms_demo/app/view/resources/constants_manager.dart';
import 'package:sms_demo/app/view/resources/styles/font_manager.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  const CustomText({
    Key? key,
    required this.text,
    this.fontColor = Colors.white,
    this.fontSize = FontSize.s16,
    this.fontWeight = FontWeight.bold,
    this.maxLines,
    this.textAlign,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: AppConstants.textScaleFactor,
      maxLines: maxLines ?? 2,
      textAlign: textAlign,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
