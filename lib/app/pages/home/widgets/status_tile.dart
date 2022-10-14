import 'package:fifa_book_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_book_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  final Widget icon;
  final int value;
  final String label;
  const StatusTile({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .7,
      child: ListTile(
        leading: SizedBox(
          height: 46,
          child: CircleAvatar(
              radius: 46, backgroundColor: context.colors.grey, child: icon),
        ),
        title: Text(
          label,
          style: context.textStyles.textPrimaryFontRegular
              .copyWith(color: Colors.white),
        ),
        contentPadding: EdgeInsets.zero,
        trailing: Text(
          '$value',
          style: context.textStyles.textPrimaryFontMedium
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}