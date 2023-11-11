import 'package:kino24/blocs/Auth/bloc/authentication_bloc.dart';

import 'package:kino24/main.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';
import 'package:kino24/widgets/custom_switch.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/custom_icon_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // GlobalKey<NavigatorState> navigatorKey = GlobalKey()

  @override
  Widget build(BuildContext context) {
    User? user = supabase.auth.currentUser;
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
            // child: Form(
            //   key: _formKey,
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
                        "User".toUpperCase(),
                        style: CustomTextStyles.titleSmallWhite,
                      ),
                    ]),
                  ),
                  SizedBox(height: 19.v),
                  Divider(height: 1, thickness: 0.7, color: appTheme.whiteP70),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 16.v),
                    child: SizedBox(
                      height: 27.v,
                      width: 359.h,
                      child: TabBar(
                          controller: _tabController,
                          labelPadding: EdgeInsets.zero,
                          labelColor: appTheme.white,
                          labelStyle: TextStyle(
                            fontSize: 16.fSize,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                          ),
                          unselectedLabelColor: appTheme.white,
                          unselectedLabelStyle: TextStyle(
                            fontSize: 16.fSize,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                          ),
                          indicator: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(
                              12.h,
                            ),
                          ),
                          tabs: const [
                            Tab(
                              child: Text(
                                "личные данные",
                              ),
                            ),
                            Tab(
                              child: Text(
                                "настройки",
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          child: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                SingleChildScrollView(
                                  child: Column(children: [
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
                                          // BlocSelector<
                                          //     ProfileBloc,
                                          //     ProfileState,
                                          //     TextEditingController?>(
                                          //   selector: (state) =>
                                          //       state.emailController,
                                          //   builder:
                                          //       (context, emailController) {
                                          //     return CustomTextFormField(
                                          //       controller: emailController,
                                          //       hintText: "example@gmail.com",
                                          //       textInputType:
                                          //           TextInputType.emailAddress,
                                          //       validator: (value) {
                                          //         return !Validators
                                          //                 .isValidEmail(value!)
                                          //             ? "Введите действительный Email"
                                          //             : null;
                                          //       },
                                          //       //     (value) {
                                          //       //   if (value == null ||
                                          //       //       (!isValidEmail(value,
                                          //       //           isRequired: true))) {
                                          //       //     return "Please enter valid email";
                                          //       //   }
                                          //       //   return null;
                                          //       // },
                                          //     );
                                          //   },
                                          // ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Телефон",
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          SizedBox(height: 3.v),
                                          // BlocSelector<
                                          //     ProfileBloc,
                                          //     ProfileState,
                                          //     TextEditingController?>(
                                          //   selector: (state) =>
                                          //       state.phoneoneController,
                                          //   builder:
                                          //       (context, phoneoneController) {
                                          //     return CustomTextFormField(
                                          //       controller: phoneoneController,
                                          //       hintText: "+7 999(999)99-99",
                                          //     );
                                          //   },
                                          // ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "День рождения",
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          SizedBox(height: 3.v),
                                          // BlocSelector<
                                          //     ProfileBloc,
                                          //     ProfileState,
                                          //     TextEditingController?>(
                                          //   selector: (state) =>
                                          //       state.birthdayoneController,
                                          //   builder: (context,
                                          //       birthdayoneController) {
                                          //     return CustomTextFormField(
                                          //       controller:
                                          //           birthdayoneController,
                                          //       hintText: "l01.01.2000",
                                          //     );
                                          //   },
                                          // ),
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
                                          "Дату рождения можно изменить только 1 раз",
                                          style: CustomTextStyles
                                              .bodySmallWhiteLight,
                                        ),
                                      ),
                                    ),
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
                                            "Имя",
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          SizedBox(height: 5.v),
                                          // BlocSelector<
                                          //     ProfileBloc,
                                          //     ProfileState,
                                          //     TextEditingController?>(
                                          //   selector: (state) =>
                                          //       state.nicknameoneController,
                                          //   builder: (context,
                                          //       nicknameoneController) {
                                          //     return CustomTextFormField(
                                          //       controller:
                                          //           nicknameoneController,
                                          //       hintText: "Киношник",
                                          //     );
                                          //   },
                                          // ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Пол",
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          SizedBox(height: 4.v),
                                          // BlocSelector<
                                          //     ProfileBloc,
                                          //     ProfileState,
                                          //     TextEditingController?>(
                                          //   selector: (state) =>
                                          //       state.genderoneController,
                                          //   builder:
                                          //       (context, genderoneController) {
                                          //     return CustomTextFormField(
                                          //       controller: genderoneController,
                                          //       hintText: "Любой",
                                          //       textInputAction:
                                          //           TextInputAction.done,
                                          //     );
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(
                                    //     left: 22.h,
                                    //     top: 22.v,
                                    //     right: 18.h,
                                    //   ),
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       TextButton(
                                    //           onPressed: () {},
                                    //           child: Text(
                                    //             'Удалить профиль',
                                    //             style: TextStyle(
                                    //                 fontStyle: CustomTextStyles
                                    //                     .titleRegularOrange14),
                                    //           ))
                                    //     ],
                                    //   ),
                                    // ),
                                  ]),
                                ),
                                SingleChildScrollView(
                                    child: Column(children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.h, top: 16.v, right: 20.h),
                                      child: Column(children: [
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
                                                                  bottom: 5.v))
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
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 2.v),
                                                            value:
                                                                isSelectedSwitch,
                                                            onChange: (value) {
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
                                                CustomButtonStyles.fillGray),
                                        SizedBox(height: 16.v),
                                      ]))
                                ]))
                              ]))),
                  // Expanded(
                  //     child: SingleChildScrollView(
                  //   child: Column(children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //         left: 22.h,
                  //         top: 22.v,
                  //         right: 18.h,
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Email",
                  //             style: theme.textTheme.bodyMedium,
                  //           ),
                  //           SizedBox(height: 5.v),
                  //           BlocSelector<ProfileBloc, ProfileState,
                  //               TextEditingController?>(
                  //             selector: (state) => state.emailController,
                  //             builder: (context, emailController) {
                  //               return CustomTextFormField(
                  //                 controller: emailController,
                  //                 hintText: "example@gmail.com",
                  //                 textInputType: TextInputType.emailAddress,
                  //                 validator: (value) {
                  //                   return !Validators.isValidEmail(value!)
                  //                       ? "Введите действительный Email"
                  //                       : null;
                  //                 },
                  //                 //     (value) {
                  //                 //   if (value == null ||
                  //                 //       (!isValidEmail(value,
                  //                 //           isRequired: true))) {
                  //                 //     return "Please enter valid email";
                  //                 //   }
                  //                 //   return null;
                  //                 // },
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //         left: 22.h,
                  //         top: 22.v,
                  //         right: 18.h,
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Телефон",
                  //             style: theme.textTheme.bodyMedium,
                  //           ),
                  //           SizedBox(height: 3.v),
                  //           BlocSelector<ProfileBloc, ProfileState,
                  //               TextEditingController?>(
                  //             selector: (state) => state.phoneoneController,
                  //             builder: (context, phoneoneController) {
                  //               return CustomTextFormField(
                  //                 controller: phoneoneController,
                  //                 hintText: "+7 999(999)99-99",
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //         left: 22.h,
                  //         top: 22.v,
                  //         right: 18.h,
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "День рождения",
                  //             style: theme.textTheme.bodyMedium,
                  //           ),
                  //           SizedBox(height: 3.v),
                  //           BlocSelector<ProfileBloc, ProfileState,
                  //               TextEditingController?>(
                  //             selector: (state) => state.birthdayoneController,
                  //             builder: (context, birthdayoneController) {
                  //               return CustomTextFormField(
                  //                 controller: birthdayoneController,
                  //                 hintText: "l01.01.2000",
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Padding(
                  //         padding: EdgeInsets.only(
                  //           left: 22.h,
                  //           top: 1.v,
                  //         ),
                  //         child: Text(
                  //           "Дату рождения можно изменить только 1 раз",
                  //           style: CustomTextStyles.bodySmallWhiteLight,
                  //         ),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //         left: 22.h,
                  //         top: 22.v,
                  //         right: 18.h,
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Имя",
                  //             style: theme.textTheme.bodyMedium,
                  //           ),
                  //           SizedBox(height: 5.v),
                  //           BlocSelector<ProfileBloc, ProfileState,
                  //               TextEditingController?>(
                  //             selector: (state) => state.nicknameoneController,
                  //             builder: (context, nicknameoneController) {
                  //               return CustomTextFormField(
                  //                 controller: nicknameoneController,
                  //                 hintText: "Киношник",
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //         left: 22.h,
                  //         top: 22.v,
                  //         right: 18.h,
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Пол",
                  //             style: theme.textTheme.bodyMedium,
                  //           ),
                  //           SizedBox(height: 4.v),
                  //           BlocSelector<ProfileBloc, ProfileState,
                  //               TextEditingController?>(
                  //             selector: (state) => state.genderoneController,
                  //             builder: (context, genderoneController) {
                  //               return CustomTextFormField(
                  //                 controller: genderoneController,
                  //                 hintText: "Любой",
                  //                 textInputAction: TextInputAction.done,
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     // Padding(
                  //     //   padding: EdgeInsets.only(
                  //     //     left: 22.h,
                  //     //     top: 22.v,
                  //     //     right: 18.h,
                  //     //   ),
                  //     //   child: Column(
                  //     //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     //     children: [
                  //     //       TextButton(
                  //     //           onPressed: ,
                  //     //           child: Text('Удалить профиль', style: TextStyle(fontStyle: CustomTextStyles.titleRegularOrange14),))
                  //     //     ],
                  //     //   ),
                  //     // ),
                  //   ]),
                  // ))
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
