import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';

class AuthReg extends StatefulWidget {
  const AuthReg({super.key});

  @override
  State<AuthReg> createState() => _AuthRegState();
}

class _AuthRegState extends State<AuthReg> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

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
                ]),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  width: 346.h,
                  margin: EdgeInsets.only(
                    left: 3.h,
                    top: 23.v,
                    right: 2.h,
                  ),
                  child: Text(
                    "Для продолжения, пожалуйста, войдите или создайте новый аккаунт",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Кино",
                        style: CustomTextStyles.headlineLargeWhiteExtraBold32,
                      ),
                      TextSpan(
                        text: "24",
                        style: CustomTextStyles.headlineLargeOrangeExtraBold32,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 208.v),
                CustomElevatedButton(
                  text: "Войти",
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                  ),
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.authorization);
                  },
                ),
                SizedBox(height: 36.v),
                CustomElevatedButton(
                  text: "Регистрация",
                  buttonStyle: CustomButtonStyles.fillGray,
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.registration);
                  },
                  // onTap: context.goNamed(AppRoutes.watchlistRoute);
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
