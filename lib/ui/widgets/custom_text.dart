import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final TextStyle? defaultStyle;
  final FontWeight? fontWeight;
  const CustomText({Key? key, required this.text, this.fontSize, this.color, this.fontWeight, this.defaultStyle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return    Text(
     text!,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.center,
      style:defaultStyle?? TextStyle(
          fontFamily: 'Akaya',
          fontSize: fontSize??20,
          fontWeight: fontWeight??FontWeight.w500,
        color: color??Theme.of(context).textSelectionTheme.selectionColor
      ),);
  }
}
