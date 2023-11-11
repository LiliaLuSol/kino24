import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/app_bar/appbar_iconbutton.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';

class Payment extends StatefulWidget {
  final dynamic movieData;

  const Payment({super.key, required this.movieData});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
                        text: "Оплата", margin: EdgeInsets.only(left: 16.h))
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
                                        child: Text(
                                          "ПОДТВЕРДИТЕ ПРАВИЛЬНОСТЬ ДАННЫХ"
                                              .toUpperCase(),
                                          style: CustomTextStyles.titleRus,
                                          maxLines: 2,
                                        )),
                                    SizedBox(height: 16.v),
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
                                              Text("Фильм:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              Text(
                                                widget.movieData["title_rus"],
                                                style: CustomTextStyles
                                                    .bodyLargeWhite,
                                                maxLines: 3,
                                              ),
                                              SizedBox(height: 16.v),
                                              Text("Формат:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              Text(
                                                widget.movieData["formats"],
                                                style: CustomTextStyles
                                                    .bodyLargeWhite,
                                              ),
                                              SizedBox(height: 16.v),
                                              Text("Зал:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              Text(
                                                widget.movieData["formats"],
                                                style: CustomTextStyles
                                                    .bodyLargeWhite,
                                              ),
                                              SizedBox(height: 16.v),
                                              Text("Места:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              Text(
                                                widget.movieData["formats"],
                                                style: CustomTextStyles
                                                    .bodyLargeWhite,
                                              ),
                                              SizedBox(height: 16.v),
                                              Text("Онлайн-бар:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              Text(
                                                widget.movieData["formats"],
                                                style: CustomTextStyles
                                                    .bodyLargeWhite,
                                                maxLines: 3,
                                              ),
                                              SizedBox(height: 16.v),
                                              Text("Email:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              Text(
                                                widget.movieData["formats"],
                                                style: CustomTextStyles
                                                    .bodyLargeOrage,
                                                maxLines: 3,
                                              ),
                                              SizedBox(height: 16.v),
                                              Text("К оплате:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              Text(
                                                widget.movieData["formats"],
                                                style: CustomTextStyles
                                                    .bodyLargeWhite,
                                                maxLines: 3,
                                              ),
                                              SizedBox(height: 16.v),
                                              Text(
                                                  "Уважаемые гости! Пожалуйста, проверьте данные заказа выше, убедитесь, что правильно выбрали фильм, дату и время сеанса. Претензии, связанные с ошибочным выбором данных не принимаются. При необходимости вы сможете вернуть купленные билеты онлайн, но не позднее, чем за 25 минут до начала сеанса. Возврат заказа в баре не производится, вы сможете получить его в течении 30 дней после даты сеанса.",
                                                  style: CustomTextStyles
                                                      .titleSmallGray),
                                              SizedBox(height: 16.v),
                                              Text("Выберите способ оплаты",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              SizedBox(height: 16.v),
                                              CustomElevatedButton(
                                                  width: 353.h,
                                                  text:
                                                      "Система быстрых платежей",
                                                  buttonStyle:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: theme
                                                        .colorScheme.primary,
                                                  ),
                                                  onTap: () {
                                                    GoRouter.of(context).push(
                                                        AppRoutes.homepage);
                                                  },
                                                  alignment: Alignment.center),
                                              SizedBox(height: 16.v),
                                              CustomElevatedButton(
                                                  width: 353.h,
                                                  text: "Банковская карта",
                                                  buttonStyle:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: theme
                                                        .colorScheme.primary,
                                                  ),
                                                  onTap: () {
                                                    GoRouter.of(context).push(
                                                        AppRoutes.homepage);
                                                  },
                                                  alignment: Alignment.center),
                                              SizedBox(height: 16.v),
                                              CustomElevatedButton(
                                                  width: 353.h,
                                                  text: "Отмена",
                                                  buttonStyle:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                  ),
                                                  buttonTextStyle: TextStyle(
                                                    color: theme
                                                        .colorScheme.primary,
                                                  ),
                                                  onTap: () {
                                                    GoRouter.of(context).push(
                                                        AppRoutes.homepage);
                                                  },
                                                  alignment: Alignment.center),
                                              SizedBox(height: 16.v),
                                            ]))
                                  ])))
                    ])))));
  }
}