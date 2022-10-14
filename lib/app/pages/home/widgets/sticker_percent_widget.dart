// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:fifa_book_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:fifa_book_app/app/core/ui/styles/colors_app.dart';

class StickerPercentWidget extends StatelessWidget {
  final int percent;
  const StickerPercentWidget({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: context.colors.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$percent%',
              style: context.textStyles.titlePrimaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 110,
          width: 110,
          child: Transform.rotate(
            angle: -pi / 2.5,
            child: CircularProgressIndicator(
              value: percent / 100,
              color: Colors.white,
              backgroundColor: Colors.white.withOpacity(.5),
              strokeWidth: 5,
            ),
          ),
        )
      ],
    );
  }
}
