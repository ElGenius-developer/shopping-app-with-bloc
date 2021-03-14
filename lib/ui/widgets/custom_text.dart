import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const CustomText({Key key, @required this.text, this.fontSize, this.color, this.fontWeight}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return    Text(
     text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Akaya',
          fontSize: fontSize??20,
          fontWeight: fontWeight??FontWeight.w500,
        color: color??Colors.black
      ),);
  }
}
