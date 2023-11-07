import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';

class Screensaver extends StatelessWidget {
  const Screensaver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      appTheme.blueP20.withOpacity(0.2),
                      appTheme.orangeP20.withOpacity(0.2),
                    ])),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Кино",
                          style: CustomTextStyles.headlineLargeWhiteExtraBold32,
                        ),
                        TextSpan(
                          text: "24",
                          style:
                              CustomTextStyles.headlineLargeOrangeExtraBold32,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ))));
  }
}
