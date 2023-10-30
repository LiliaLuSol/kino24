import 'bloc/registration_bloc.dart';
import 'models/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/app_bar/appbar_iconbutton_1.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/custom_checkbox_button.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';
import 'package:kino24/widgets/custom_icon_button.dart';
import 'package:kino24/widgets/custom_text_form_field.dart';

class Registration extends StatelessWidget {
  Registration({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final inputfieldoneFocusNode = FocusNode();
  final inputfieldFocusNode = FocusNode();

  static Widget builder(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
        create: (context) => RegistrationBloc(
            RegistrationState(registrationModelObj: RegistrationModel()))
          ..add(RegistrationInitialEvent()),
        child: Registration());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child:  GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
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
                                horizontal: 18.h, vertical: 30.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 34.v),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 13.v),
                                      child: Text("lbl9".tr,
                                          style:
                                              theme.textTheme.headlineLarge)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 32.v),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("msg_email".tr,
                                                style:
                                                    theme.textTheme.bodyMedium),
                                            SizedBox(height: 4.v),
                                            BlocSelector<
                                                    RegistrationBloc,
                                                    RegistrationState,
                                                    TextEditingController?>(
                                                selector: (state) =>
                                                    state.emailController,
                                                builder:
                                                    (context, emailController) {
                                                  return CustomTextFormField(
                                                      controller:
                                                          emailController,
                                                     focusNode: emailFocusNode,
                                                      hintText:
                                                          "msg_example".tr,
                                                      textInputType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            (!isValidEmail(
                                                                value,
                                                                isRequired:
                                                                    true))) {
                                                          return "Please enter valid email";
                                                        }
                                                        return null;
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
                                            Text("msg11".tr,
                                                style:
                                                    theme.textTheme.bodyMedium),
                                            SizedBox(height: 3.v),
                                            BlocBuilder<RegistrationBloc,
                                                    RegistrationState>(
                                                builder: (context, state) {
                                              return CustomTextFormField(
                                                  controller: state
                                                      .inputfieldoneController,
                                                  focusNode:inputfieldoneFocusNode,
                                                  suffix: InkWell(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                RegistrationBloc>()
                                                            .add(ChangePasswordVisibilityEvent(
                                                                value: !state
                                                                    .isShowPassword));
                                                      },
                                                      child: Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
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
                                                  suffixConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 56.v),
                                                  obscureText:
                                                      state.isShowPassword);
                                            })
                                          ])),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 4.h, top: 22.v),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("msg34".tr,
                                                style:
                                                    theme.textTheme.bodyMedium),
                                            SizedBox(height: 3.v),
                                            BlocBuilder<RegistrationBloc,
                                                    RegistrationState>(
                                                builder: (context, state) {
                                              return CustomTextFormField(
                                                  controller: state
                                                      .inputfieldController,
                                                  focusNode: inputfieldFocusNode,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  suffix: InkWell(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                RegistrationBloc>()
                                                            .add(ChangePasswordVisibilityEvent1(
                                                                value: !state
                                                                    .isShowPassword1));
                                                      },
                                                      child: Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  30.h,
                                                                  21.v,
                                                                  18.h,
                                                                  22.v),
                                                          child: CustomImageView(
                                                              svgPath: state
                                                                      .isShowPassword1
                                                                  ? ImageConstant
                                                                      .imgEye
                                                                  : ImageConstant
                                                                      .imgEye))),
                                                  suffixConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 56.v),
                                                  obscureText:
                                                      state.isShowPassword1);
                                            })
                                          ])),
                                  BlocSelector<RegistrationBloc,
                                          RegistrationState, bool?>(
                                      selector: (state) => state.wantNewsInfo,
                                      builder: (context, wantNewsInfo) {
                                        return CustomCheckboxButton(
                                            text: "msg12".tr,
                                            isExpandedText: true,
                                            value: wantNewsInfo,
                                            margin: EdgeInsets.only(
                                                left: 4.h,
                                                top: 33.v,
                                                right: 28.h),
                                            onChange: (value) {
                                              context
                                                  .read<RegistrationBloc>()
                                                  .add(ChangeCheckBoxEvent(
                                                      value: value));
                                            });
                                      }),
                                  CustomElevatedButton(
                                    text: "lbl62".tr,
                                    margin:
                                        EdgeInsets.only(left: 3.h, top: 27.v),
                                    buttonStyle: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          theme.colorScheme.primary,
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
                                                padding: EdgeInsets.only(
                                                    bottom: 10.v),
                                                child: SizedBox(
                                                    width: 100.h,
                                                    child: Divider(
                                                        thickness: 0.7,
                                                        color: appTheme
                                                            .whiteP70))),
                                            Text("msg31".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumWhite),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10.v),
                                                child: SizedBox(
                                                    width: 100.h,
                                                    child: Divider(
                                                        thickness: 0.7,
                                                        color:
                                                            appTheme.whiteP70)))
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
                                              decoration: IconButtonStyleHelper
                                                  .fillWhiteA,
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
                                              decoration: IconButtonStyleHelper
                                                  .fillWhiteA,
                                              child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgCevicongoogle,
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
                                                decoration:
                                                    IconButtonStyleHelper
                                                        .fillWhiteA,
                                                child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgUilvk,
                                                ))
                                          ])),
                                  SizedBox(height: 33.v),
                                  Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                          onTap: () {
                                            NavigatorService.pushNamed(
                                              AppRoutes.authorization,
                                            );
                                          },
                                          child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text: "msg13".tr,
                                                    style: theme
                                                        .textTheme.bodyMedium),
                                                TextSpan(text: "  ".tr),
                                                TextSpan(
                                                    text: "lbl8".tr,
                                                    style: CustomTextStyles
                                                        .bodyMediumPrimary)
                                              ]),
                                              textAlign: TextAlign.left)))
                                ])))))));
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

  /// Navigates to the authorizationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the authorizationScreen.
// onTapTxttf(BuildContext context) {
//   NavigatorService.pushNamed(
//     AppRoutes.authorizationScreen,
//   );
// }
}
