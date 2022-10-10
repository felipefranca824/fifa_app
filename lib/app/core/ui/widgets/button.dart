// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fifa_book_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_book_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final bool outline;
  const Button({
    Key? key,
    required this.style,
    required this.labelStyle,
    required this.label,
    this.height,
    this.width,
    this.onPressed,
    this.outline = false,
  }) : super(key: key);

  Button.primary({
    Key? key,
    required this.label,
    this.height,
    this.width,
    this.onPressed,
  })  : style = ButtonStyles.i.primaryButton,
        labelStyle = TextStyles.i.textSecondaryFontExtraBold,
        outline = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );
    return SizedBox(
      height: height,
      width: width,
      child: outline
          ? OutlinedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            ),
    );
  }
}
