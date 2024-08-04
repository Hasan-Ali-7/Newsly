import 'package:flutter/material.dart';


Widget cButton({
  double width = double.infinity,
  double height = 55,
  required VoidCallback onPressed,
  required String text,
  required Color? textColor,
  EdgeInsetsGeometry? margin,
  Color? backgroundColor ,
  Gradient? gradient,
}) =>
    Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        color: backgroundColor, 
        borderRadius: BorderRadius.circular(50)
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 28,
            color: textColor,
          ),
        ),
      ),
    );




Widget cButton2({
  double width = double.infinity,
  double height = 60,
  Color background = Colors.orange,
  required VoidCallback onPressed,
  required Widget child,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: onPressed,
        child: child,
      ),
    );


