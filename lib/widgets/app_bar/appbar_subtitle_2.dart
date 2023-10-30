import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitle2 extends StatelessWidget {
  AppbarSubtitle2({
    Key? key,
    required this.text,
    this.margin,
    this.align,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.bodyMediumLight.copyWith(
            color: appTheme.white,
          ),
        ),
      ),
    );
  }
}
