import 'package:kino24/blocs/Auth/bloc/authentication_bloc.dart';
import 'package:kino24/main.dart';

import 'package:kino24/widgets/app_bar/appbar_subtitle.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';
import 'package:kino24/widgets/custom_switch.dart';
import 'package:kino24/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  final _emailcontroller = TextEditingController();
  final emailFocusNode = FocusNode();

  String? getEmail(){
      final currentUser = supabase.auth.currentUser;
      if (currentUser != null) {
        final email = currentUser.email!;
        return email;
      } else {
        return "Ваш email скоро здесь появится...";
      }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is UnAuthenticatedState) {
          GoRouter.of(context).pushReplacement(AppRoutes.authReg);
        } else if (state is AuthErrorState) {
          context.showsnackbar(title: 'Что-то пошло не так!');
        }
      },
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            height: 75.v,
            leadingWidth: double.maxFinite,
            title: Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: AppbarSubtitle(text: "Профиль")),
            styleType: Style.bgFill,
          ),
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
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 75.v),
                  Divider(height: 1, thickness: 0.7, color: appTheme.whiteP70),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: 22.h,
                                      top: 22.v,
                                      right: 18.h,
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Email",
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          SizedBox(height: 5.v),
                                          CustomTextFormField(
                                            controller: _emailcontroller,
                                            focusNode: emailFocusNode,
                                            autofocus: false,
                                            textStyle: const TextStyle(
                                                color: Colors.black),
                                            hintText: getEmail(),
                                            textInputType:
                                                TextInputType.emailAddress,
                                            enableInteractiveSelection: false,
                                            enabled: false,

                                          ),
                                          SizedBox(height: 16.v),
                                          GestureDetector(
                                              onTap: () {
                                                GoRouter.of(context)
                                                    .push(AppRoutes.support);
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 13.h,
                                                      vertical: 15.v),
                                                  decoration: AppDecoration
                                                      .fillOnPrimary
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder15),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Обратная связь",
                                                            style: CustomTextStyles
                                                                .bodyLargeWhite),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgArrowright,
                                                            height: 15.v,
                                                            width: 9.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 2.v,
                                                                    bottom:
                                                                        5.v))
                                                      ]))),
                                          SizedBox(height: 16.v),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 13.h,
                                                  vertical: 15.v),
                                              decoration: AppDecoration
                                                  .fillOnPrimary
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder15),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Уведомления",
                                                        style: CustomTextStyles
                                                            .bodyLargeWhite),
                                                    BlocSelector<
                                                            AuthenticationBloc,
                                                            AuthenticationState,
                                                            bool?>(
                                                        selector: (state) => state
                                                            .isSelectedSwitch,
                                                        builder: (context,
                                                            isSelectedSwitch) {
                                                          return CustomSwitch(
                                                              height: 15.v,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 2.v),
                                                              value:
                                                                  isSelectedSwitch,
                                                              onChange:
                                                                  (value) {
                                                                context
                                                                    .read<
                                                                        AuthenticationBloc>()
                                                                    .add(ChangeSwitchEvent(
                                                                        value:
                                                                            value));
                                                              });
                                                        })
                                                  ])),
                                          SizedBox(height: 290.v),
                                          CustomElevatedButton(
                                            text: "Выход из аккаунта",
                                            buttonStyle:
                                                CustomButtonStyles.fillGray,
                                            onTap: () {
                                              context
                                                  .read<AuthenticationBloc>()
                                                  .add(const SignOutEvent());
                                            },
                                          ),
                                          SizedBox(height: 16.v),
                                        ]))
                              ])))),
                ],
              ),
            ),
          ),
        ),
      ),
      //  )
    );
  }
}
