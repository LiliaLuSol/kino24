import 'package:flutter/material.dart';
import 'package:kino24/blocs/Auth/bloc/authentication_bloc.dart';
import 'package:kino24/main.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/payment/payment.dart';
import 'package:kino24/utils/validator.dart';
import 'package:kino24/widgets/app_bar/appbar_iconbutton.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/custom_checkbox_button.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';
import 'package:kino24/widgets/custom_icon_button.dart';
import 'package:kino24/widgets/custom_text_form_field.dart';

class Result extends StatefulWidget {
  final dynamic movieData;

  const Result({super.key, required this.movieData});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late TextEditingController _emailcontroller;
  final emailFocusNode = FocusNode();
  bool isEmailValid = false;

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
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
              height: 75.v,
              leadingWidth: double.maxFinite,
              leading: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Row(children: [
                    AppbarIconbutton(
                        svgPath: ImageConstant.imgArrowleft,
                        margin: EdgeInsets.only(bottom: 4.v),
                        onTap: () {
                          Navigator.pop(context, true);
                        }),
                    AppbarSubtitle(
                        text: "Итого", margin: EdgeInsets.only(left: 16.h))
                  ])),
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
                      appTheme.blueP20.withOpacity(0.2),
                      appTheme.orangeP20.withOpacity(0.2),
                    ])),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(
                        height: 75.v,
                      ),
                      Divider(
                          height: 1, thickness: 0.8, color: appTheme.whiteP70),
                      Expanded(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.h, right: 20.h, top: 20.v),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 3.v),
                                                      child: Text(
                                                          widget.movieData[
                                                              "title_rus"],
                                                          style:
                                                              CustomTextStyles
                                                                  .titleRus,
                                                          maxLines: 3)),
                                                  Container(
                                                    width: 39.h,
                                                    height: 34.v,
                                                    color:
                                                        appTheme.blackBackP80,
                                                    alignment: Alignment.center,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: widget
                                                                .movieData[
                                                                    "age_rating"]
                                                                .toString(),
                                                            style: CustomTextStyles
                                                                .bodySmallWhiteLight12,
                                                          ),
                                                          TextSpan(
                                                            text: "+",
                                                            style: CustomTextStyles
                                                                .bodySmallWhiteLight12,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                            SizedBox(height: 16.v),
                                            Text("дата и время",
                                                style: CustomTextStyles
                                                    .titleMediumWhite),
                                            Text("Билеты",
                                                style:
                                                    CustomTextStyles.titleRus),
                                            Text("Онлайн-бар",
                                                style:
                                                    CustomTextStyles.titleRus),
                                            SizedBox(height: 16.v),
                                            RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text: "ИТОГО: ",
                                                    style: theme
                                                        .textTheme.titleLarge),
                                                TextSpan(
                                                    text: "1000.00",
                                                    style: CustomTextStyles
                                                        .titleLargePrimary),
                                                TextSpan(
                                                    text: " руб.",
                                                    style: CustomTextStyles
                                                        .titleLargePrimary)
                                              ]),
                                            ),
                                            SizedBox(height: 16.v),
                                          ]),
                                    ),
                                    Divider(
                                        height: 1,
                                        thickness: 0.8,
                                        color: appTheme.whiteP70),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.h, right: 20.h, top: 20.v),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Данные для получения заказа",
                                                  style: CustomTextStyles
                                                      .titleRus),
                                              SizedBox(height: 16.v),
                                              Text(
                                                  "Укажите email, куда прислать билеты",
                                                  style: theme
                                                      .textTheme.bodyMedium),
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
                                                  return !Validators
                                                          .isValidEmail(value!)
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
                                              ),
                                              SizedBox(height: 16.v),
                                              BlocSelector<
                                                      AuthenticationBloc,
                                                      AuthenticationState,
                                                      bool?>(
                                                  selector: (state) =>
                                                      state.wantNewsInfo,
                                                  builder:
                                                      (context, wantNewsInfo) {
                                                    return CustomCheckboxButton(
                                                        text:
                                                            "Принимаю условия покупки билетов и товаров",
                                                        isExpandedText: true,
                                                        value: wantNewsInfo,
                                                        checkColor: theme
                                                            .colorScheme
                                                            .primary,
                                                        margin: EdgeInsets.only(
                                                            left: 4.h,
                                                            top: 33.v,
                                                            right: 28.h),
                                                        onChange: (value) {
                                                          context
                                                              .read<
                                                                  AuthenticationBloc>()
                                                              .add(ChangeCheckBoxEvent(
                                                                  value:
                                                                      value));
                                                        });
                                                  }),
                                              if (widget.movieData[
                                                      "age_rating"] ==
                                                  18)
                                                Text(
                                                    "ВАЖНО! Уважаемые гости, фильм относится к категории 18+. Лица моложе 18 лет не будут допущены на сеанс даже в сопровождении взрослых. Сотрудники вправе попросить предъявить удостоверение личности (оригинал).",
                                                    maxLines: 6,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: CustomTextStyles
                                                        .titleSmallGray),
                                              SizedBox(height: 16.v),
                                              CustomElevatedButton(
                                                  width: 353.h,
                                                  text: "Продолжить",
                                                  buttonStyle:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: theme
                                                        .colorScheme.primary,
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Payment(
                                                                movieData: widget
                                                                    .movieData),
                                                      ),
                                                    );
                                                  },
                                                  alignment: Alignment.center),
                                              SizedBox(height: 16.v),
                                            ]))
                                  ])))
                    ])))));
  }
}
