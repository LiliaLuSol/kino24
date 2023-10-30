import 'bloc/profile_user_bloc.dart';
import 'models/profile_user_model.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/utils/validation_functions.dart';
import 'package:kino24/pages/homepage/homepag.dart';

//import 'package:kino24/pages/tickets_activ/tickets_activ_page.dart';
import 'package:kino24/widgets/custom_bottom_bar.dart';
import 'package:kino24/widgets/custom_icon_button.dart';
import 'package:kino24/widgets/custom_text_form_field.dart';

class ProfileUser extends StatelessWidget {
  ProfileUser({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileUserBloc>(
      create: (context) => ProfileUserBloc(ProfileUserState(
        profileUserModelObj: ProfileUserModel(),
      ))
        ..add(ProfileUserInitialEvent()),
      child: ProfileUser(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                appTheme.orangeP20.withOpacity(0.2),
                appTheme.blackBack.withOpacity(0.2),
              ],
            ),
          ),
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 28.v),
                  Center(
                    child: Column(children: [
                      SizedBox(
                        height: 123.adaptSize,
                        width: 123.adaptSize,
                        child: Stack(
                          // alignment: Alignment.bottomRight,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgRectangle11,
                              height: 110.adaptSize,
                              width: 110.adaptSize,
                              radius: BorderRadius.circular(
                                12.h,
                              ),
                              alignment: Alignment.center,
                            ),
                            CustomIconButton(
                              height: 27.adaptSize,
                              width: 27.adaptSize,
                              padding: EdgeInsets.all(6.h),
                              decoration: IconButtonStyleHelper.outlinePrimary,
                              alignment: Alignment.bottomRight,
                              child: CustomImageView(
                                svgPath: ImageConstant.imgLinedesigneditline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.v),
                      Text(
                        "lbl_lilia".tr.toUpperCase(),
                        style: CustomTextStyles.titleSmallWhite,
                      ),
                    ]),
                  ),
                  SizedBox(height: 19.v),
                  Divider(height: 1, thickness: 0.7, color: appTheme.whiteP70),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      top: 16.v,
                      right: 16.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.h,
                            vertical: 1.v,
                          ),
                          decoration:
                              AppDecoration.fillPrimaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          ),
                          child: Text(
                            "lbl22".tr,
                            style: CustomTextStyles.bodyLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.v),
                          child: Text(
                            "lbl23".tr,
                            style: CustomTextStyles.bodyLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.v),
                          child: Text(
                            "lbl24".tr,
                            style: CustomTextStyles.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          top: 15.v,
                          right: 18.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_email".tr,
                              style: theme.textTheme.bodyMedium,
                            ),
                            SizedBox(height: 5.v),
                            BlocSelector<ProfileUserBloc, ProfileUserState,
                                TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                  controller: emailController,
                                  hintText: "msg_example_gmail_com".tr,
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          top: 22.v,
                          right: 18.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "lbl25".tr,
                              style: theme.textTheme.bodyMedium,
                            ),
                            SizedBox(height: 3.v),
                            BlocSelector<ProfileUserBloc, ProfileUserState,
                                TextEditingController?>(
                              selector: (state) => state.phoneoneController,
                              builder: (context, phoneoneController) {
                                return CustomTextFormField(
                                  controller: phoneoneController,
                                  hintText: "msg_7_999_999_99_99".tr,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          top: 22.v,
                          right: 18.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "lbl26".tr,
                              style: theme.textTheme.bodyMedium,
                            ),
                            SizedBox(height: 3.v),
                            BlocSelector<ProfileUserBloc, ProfileUserState,
                                TextEditingController?>(
                              selector: (state) => state.birthdayoneController,
                              builder: (context, birthdayoneController) {
                                return CustomTextFormField(
                                  controller: birthdayoneController,
                                  hintText: "lbl_01_01_2000".tr,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 22.h,
                            top: 1.v,
                          ),
                          child: Text(
                            "msg11".tr,
                            style: CustomTextStyles.bodySmallWhiteLight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          top: 19.v,
                          right: 18.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "lbl27".tr,
                              style: theme.textTheme.bodyMedium,
                            ),
                            SizedBox(height: 5.v),
                            BlocSelector<ProfileUserBloc, ProfileUserState,
                                TextEditingController?>(
                              selector: (state) => state.nicknameoneController,
                              builder: (context, nicknameoneController) {
                                return CustomTextFormField(
                                  controller: nicknameoneController,
                                  hintText: "lbl28".tr,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          top: 21.v,
                          right: 18.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "lbl29".tr,
                              style: theme.textTheme.bodyMedium,
                            ),
                            SizedBox(height: 4.v),
                            BlocSelector<ProfileUserBloc, ProfileUserState,
                                TextEditingController?>(
                              selector: (state) => state.genderoneController,
                              builder: (context, genderoneController) {
                                return CustomTextFormField(
                                  controller: genderoneController,
                                  hintText: "lbl30".tr,
                                  textInputAction: TextInputAction.done,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Navigator.pushNamed(
                navigatorKey.currentContext!, getCurrentRoute(type));
          },
        ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Homegray800:
        return "/";
      case BottomBarEnum.Info:
      // return AppRoutes.ticketsActivPage;
      case BottomBarEnum.Profile:
      // return AppRoutes.homepagePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
//   Widget getCurrentPage(
//     BuildContext context,
//     String currentRoute,
//   ) {
//     switch (currentRoute) {
//       // case AppRoutes.ticketsActivPage:
//       //   return TicketsActivPage.builder(context);
//       case AppRoutes.homepage:
//         return Homepage.builder(context);
//       // default:
//       //   return DefaultWidget();
//     }
//   }
}
