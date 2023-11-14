import 'package:kino24/blocs/Auth/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/utils/validator.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization>
    with SingleTickerProviderStateMixin {
  late TextEditingController _emailcontroller;
  late TextEditingController _passcontroller;
  final _formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late final Animation<double> _rotationAnimation;

  final emailFocusNode = FocusNode();
  final inputfieldoneFocusNode = FocusNode();

  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    _passcontroller = TextEditingController();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..forward();

    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passcontroller = TextEditingController();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc blocProvider =
    BlocProvider.of<AuthenticationBloc>(context);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: GestureDetector(
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
                        margin: EdgeInsets.only(left: 20.h, right: 333.h),
                        onTap: () {
                          GoRouter.of(context).push(AppRoutes.authReg);
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
                                      padding:
                                      EdgeInsets.only(left: 4.h, top: 9.v),
                                      child: Text("Войти",
                                          style:
                                          theme.textTheme.headlineLarge)),
                                  Padding(
                                      padding:
                                      EdgeInsets.only(left: 4.h, top: 37.v),
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Введите ваш email",
                                                style:
                                                theme.textTheme.bodyMedium),
                                            SizedBox(height: 4.v),
                                            CustomTextFormField(
                                              controller: _emailcontroller,
                                              focusNode: emailFocusNode,
                                              autofocus: false,
                                              textStyle: TextStyle(
                                                  color: Colors.black),
                                              hintText: "example@gmail.com",
                                              textInputType:
                                              TextInputType.emailAddress,
                                              validator: (value) {
                                                return !Validators.isValidEmail(
                                                    value!)
                                                    ? "Введите действительный Email"
                                                    : null;
                                              },
                                              onChanged: (value) {
                                                setState(() {
                                                  isEmailValid =
                                                      Validators.isValidEmail(
                                                          value);
                                                });
                                              },
                                            )
                                          ])),
                                  Padding(
                                      padding:
                                      EdgeInsets.only(left: 4.h, top: 22.v),
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Введите ваш пароль",
                                                style:
                                                theme.textTheme.bodyMedium),
                                            SizedBox(height: 3.v),
                                            BlocBuilder<AuthenticationBloc,
                                                AuthenticationState>(
                                                builder: (context, state) {
                                                  return CustomTextFormField(
                                                    controller: _passcontroller,
                                                    focusNode:
                                                    inputfieldoneFocusNode,
                                                    autofocus: false,
                                                    textStyle: TextStyle(
                                                        color: Colors.black),
                                                    textInputAction:
                                                    TextInputAction.done,
                                                    hintText: "Password",
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isPasswordValid =
                                                            value.length >= 6;
                                                      });
                                                    },
                                                    suffix: InkWell(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                              AuthenticationBloc>()
                                                              .add(
                                                              ChangePasswordVisibilityEvent(
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
                                                                  .imgEye,
                                                            ))),
                                                    suffixConstraints:
                                                    BoxConstraints(
                                                        maxHeight: 56.v),
                                                    obscureText:
                                                    // state.isShowPassword,
                                                    state.isShowPassword,
                                                    validator: (value) {
                                                      return value!.length < 6
                                                          ? "Введите действительный пароль"
                                                          : null;
                                                    },
                                                  );
                                                })
                                          ])),
                                  Spacer(),
                                  BlocListener<AuthenticationBloc, AuthenticationState>(
                                    listener: (context, state) {
                                      if (state is AuthSuccessState) {
                                        GoRouter.of(context).push(AppRoutes.homepage);
                                      } else if (state is AuthErrorState) {
                                        context.showsnackbar(title: 'Неверный email или пароль!');
                                      }
                                    },
                                    child: CustomElevatedButton(
                                      text: "Войти",
                                      margin: EdgeInsets.only(left: 2.h),
                                      buttonStyle: isEmailValid && isPasswordValid
                                          ? ElevatedButton.styleFrom(
                                          backgroundColor: theme.colorScheme.primary)
                                          : CustomButtonStyles.fillGray,
                                      onTap: isEmailValid && isPasswordValid
                                          ? () {
                                        if (_formKey.currentState!.validate()) {
                                          BlocProvider.of<AuthenticationBloc>(context)
                                              .add(EmailSignInAuthEvent(
                                            _emailcontroller.text,
                                            _passcontroller.text,
                                          ));
                                        }
                                      }
                                          : null,
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
                                                    width: 80.h,
                                                    child: Divider(
                                                        thickness: 0.7,
                                                        color: appTheme
                                                            .whiteP70))),
                                            Text("Или войдите с помощью",
                                                style: CustomTextStyles
                                                    .bodyMediumWhite),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10.v),
                                                child: SizedBox(
                                                    width: 80.h,
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
                                              onTap: () {
                                                context.showsnackbar(
                                                    title: 'Скоро будет!',
                                                    color: Colors.grey);
                                              },
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
                                              onTap: () {
                                                blocProvider.add(
                                                    const GoogleAuthEvent());
                                                context.showsnackbar(
                                                    title:
                                                    'Что-то пошло не так!');
                                              },
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
                                                onTap: () {
                                                  context.showsnackbar(
                                                      title: 'Скоро будет!',
                                                      color: Colors.grey);
                                                },
                                                child: CustomImageView(
                                                  svgPath:
                                                  ImageConstant.imgUilvk,
                                                ))
                                          ])),
                                  SizedBox(height: 34.v),
                                  Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                          onTap: () {
                                            GoRouter.of(context)
                                                .push(AppRoutes.registration);
                                          },
                                          child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Нет аккаунта?",
                                                    style: theme
                                                        .textTheme.bodyMedium),
                                                TextSpan(text: "  "),
                                                TextSpan(
                                                    text: "Регистрация",
                                                    style: CustomTextStyles
                                                        .bodyMediumPrimary)
                                              ]),
                                              textAlign: TextAlign.left)))
                                ])))))));
  }
}
