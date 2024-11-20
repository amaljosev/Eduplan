import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.title,
      this.fontSize = 15.0,
      this.fontColor = Colors.white,
      this.borderRadius = 12,
      this.padding = 10,this.onTap});
  final String title;
  final double fontSize;
  final Color fontColor;
  final double borderRadius;
  final double padding;
  final  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      padding: EdgeInsets.all(padding),
      child: Text(title,
          style: TextStyle(
              color: fontColor, fontFamily: 'Poppins', fontSize: fontSize)),
    );
  }
}
