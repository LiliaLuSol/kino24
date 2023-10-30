import 'bloc/auth_reg_bloc.dart';
import 'models/auth_reg_model.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';

class AuthReg extends StatelessWidget {
  const AuthReg({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AuthRegBloc>(
      create: (context) => AuthRegBloc(AuthRegState(
        authRegModelObj: AuthRegModel(),
      ))
        ..add(AuthRegInitialEvent()),
      child: AuthReg(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<AuthRegBloc, AuthRegState>(
      builder: (context, state) {
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
                        "msg9".tr,
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
                            text: "lbl".tr,
                            style:
                                CustomTextStyles.headlineLargeWhiteExtraBold32,
                          ),
                          TextSpan(
                            text: "lbl_24".tr,
                            style:
                                CustomTextStyles.headlineLargeOrangeExtraBold32,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 132.v),
                    CustomElevatedButton(
                      text: "lbl8".tr,
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      onTap: () {
                        NavigatorService.pushNamed(
                          AppRoutes.authorization,
                        );
                      },
                    ),
                    SizedBox(height: 36.v),
                    CustomElevatedButton(
                      text: "lbl9".tr,
                      buttonStyle: CustomButtonStyles.fillGray,
                      onTap: () {
                        NavigatorService.pushNamed(
                          AppRoutes.registration,
                        );
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
