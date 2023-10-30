import 'bloc/authorization_bloc.dart';
import 'models/authorization_model.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/app_bar/appbar_iconbutton_1.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';
import 'package:kino24/widgets/custom_icon_button.dart';
import 'package:kino24/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class Authorization extends StatelessWidget {
  Authorization({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AuthorizationBloc>(
        create: (context) => AuthorizationBloc(
            AuthorizationState(authorizationModelObj: AuthorizationModel()))
          ..add(AuthorizationInitialEvent()),
        child: Authorization());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: 45.v,
                leadingWidth: double.maxFinite,
                leading: AppbarIconbutton1(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: EdgeInsets.only(left: 21.h, right: 333.h),
                    onTap: () {
                      onTapArrowleftone(context);
                    })),
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      appTheme.blueP20.withOpacity(0.2),
                      appTheme.blackBack.withOpacity(0.2),
                    ],
                  ),
                ),
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.h, vertical: 29.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 34.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 4.h, top: 9.v),
                                  child: Text("lbl8".tr,
                                      style: theme.textTheme.headlineLarge)),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 4.h, top: 37.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("msg_email".tr,
                                            style: theme.textTheme.bodyMedium),
                                        SizedBox(height: 4.v),
                                        BlocSelector<
                                                AuthorizationBloc,
                                                AuthorizationState,
                                                TextEditingController?>(
                                            selector: (state) =>
                                                state.emailController,
                                            builder:
                                                (context, emailController) {
                                              return CustomTextFormField(
                                                  controller: emailController,
                                                  hintText: "msg_example".tr,
                                                  textInputType: TextInputType
                                                      .emailAddress,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        (!isValidEmail(value,
                                                            isRequired:
                                                                true))) {
                                                      return "err_email".tr;
                                                      return null;
                                                    }
                                                  });
                                            })
                                      ])),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 4.h, top: 22.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("msg10".tr,
                                            style: theme.textTheme.bodyMedium),
                                        SizedBox(height: 3.v),
                                        BlocBuilder<AuthorizationBloc,
                                                AuthorizationState>(
                                            builder: (context, state) {
                                          return CustomTextFormField(
                                              controller:
                                                  state.inputfieldoneController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              suffix: InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                            AuthorizationBloc>()
                                                        .add(ChangePasswordVisibilityEvent(
                                                            value: !state
                                                                .isShowPassword));
                                                  },
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              30.h,
                                                              21.v,
                                                              18.h,
                                                              22.v),
                                                      child: CustomImageView(
                                                          svgPath: state
                                                                  .isShowPassword
                                                              ? ImageConstant
                                                                  .imgEye
                                                              : ImageConstant
                                                                  .imgEye))),
                                              suffixConstraints: BoxConstraints(
                                                  maxHeight: 56.v),
                                              obscureText:
                                                  state.isShowPassword);
                                        })
                                      ])),
                              Spacer(),
                              CustomElevatedButton(
                                text: "lbl8".tr,
                                margin: EdgeInsets.only(left: 2.h),
                                buttonStyle: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.primary,
                                ),
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 3.h, top: 48.v),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.v),
                                            child: SizedBox(
                                                width: 100.h,
                                                child: Divider(
                                                    thickness: 0.7,
                                                    color: appTheme.whiteP70))),
                                        Text("msg31".tr,
                                            style: CustomTextStyles
                                                .bodyMediumWhite),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.v),
                                            child: SizedBox(
                                                width: 100.h,
                                                child: Divider(
                                                    thickness: 0.7,
                                                    color: appTheme.whiteP70)))
                                      ])),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 4.h, top: 20.v, right: 5.h),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomIconButton(
                                          height: 56.v,
                                          width: 108.h,
                                          padding: EdgeInsets.only(
                                              top: 12.h,
                                              bottom: 12.h,
                                              left: 42.h,
                                              right: 42.h),
                                          decoration:
                                              IconButtonStyleHelper.fillWhiteA,
                                          child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgBrandicoyandexrect,
                                          ),
                                        ),
                                        CustomIconButton(
                                          height: 56.v,
                                          width: 108.h,
                                          padding: EdgeInsets.only(
                                              top: 12.h,
                                              bottom: 12.h,
                                              left: 42.h,
                                              right: 42.h),
                                          decoration:
                                              IconButtonStyleHelper.fillWhiteA,
                                          child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgCevicongoogle,
                                          ),
                                        ),
                                        CustomIconButton(
                                            height: 56.v,
                                            width: 108.h,
                                            padding: EdgeInsets.only(
                                                top: 9.h,
                                                bottom: 9.h,
                                                left: 42.h,
                                                right: 42.h),
                                            decoration: IconButtonStyleHelper
                                                .fillWhiteA,
                                            child: CustomImageView(
                                              svgPath: ImageConstant.imgUilvk,
                                            ))
                                      ])),
                              SizedBox(height: 34.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                     onTap: () {
                                       NavigatorService.pushNamed(
                                         AppRoutes.registration,
                                       );
                                     },
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "lbl61".tr,
                                                style:
                                                    theme.textTheme.bodyMedium),
                                            TextSpan(text: "  "),
                                            TextSpan(
                                                text: "lbl9".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumPrimary)
                                          ]),
                                          textAlign: TextAlign.left)))
                            ]))))));
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the registrationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the registrationScreen.
// onTapTxttf(BuildContext context) {
//   NavigatorService.pushNamed(
//     //AppRoutes.registrationScreen,
//   );
// }
}
