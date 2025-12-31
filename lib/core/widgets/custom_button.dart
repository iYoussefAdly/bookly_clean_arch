import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.borderRadius,
    required this.backGroundColor,
    required this.textColor,
    this.fontWeight,
    required this.text,
  });
  final Color textColor;
  final Color backGroundColor;
  final BorderRadiusGeometry? borderRadius;
  final FontWeight? fontWeight;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 55,
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(backGroundColor),
          ),
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(
              color: textColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
