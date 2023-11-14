import 'package:flutter/material.dart';
import 'package:kino24/blocs/Auth/bloc/authentication_bloc.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/payment/payment.dart';
import 'package:kino24/utils/validator.dart';
import 'package:kino24/widgets/app_bar/appbar_iconbutton.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/custom_checkbox_button.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';
import 'package:kino24/widgets/custom_text_form_field.dart';

class Result extends StatefulWidget {
  final dynamic movieData;
  final dynamic selectedTikets;
  final dynamic selectedfood;
  final dynamic selectedId;
  final int hall;
  final int id_show;
  final int totalAmoutTickets;
  final int totalAmoutFood;
  final String? selectedDate;
  final String? selectedTime;

  const Result(
      {super.key,
      required this.movieData,
      required this.hall,
      required this.selectedDate,
      required this.selectedTime,
      required this.selectedTikets,
      required this.selectedId,
      required this.totalAmoutTickets,
      required this.totalAmoutFood,
        required this.id_show,
      required this.selectedfood});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late TextEditingController _emailcontroller;
  final emailFocusNode = FocusNode();
  bool isEmailValid = false;
  bool wantNewsInfo1 = false;
  String email = "";

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
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
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
                              height: 1,
                              thickness: 0.8,
                              color: appTheme.whiteP70),
                          Expanded(
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.h,
                                              right: 20.h,
                                              top: 20.v),
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
                                                          padding:
                                                              EdgeInsets.only(
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
                                                        color: appTheme
                                                            .blackBackP80,
                                                        alignment:
                                                            Alignment.center,
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
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text:
                                                            widget.selectedDate,
                                                        style: CustomTextStyles
                                                            .titleMediumWhite),
                                                    TextSpan(
                                                        text: " в ",
                                                        style: CustomTextStyles
                                                            .titleMediumWhite),
                                                    TextSpan(
                                                        text:
                                                            widget.selectedTime,
                                                        style: CustomTextStyles
                                                            .titleMediumWhite)
                                                  ]),
                                                ),
                                                SizedBox(height: 4.v),
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "Зал ",
                                                        style: CustomTextStyles
                                                            .titleMediumWhite),
                                                    TextSpan(
                                                        text: widget.hall
                                                            .toString(),
                                                        style: CustomTextStyles
                                                            .titleMediumWhite),
                                                    TextSpan(
                                                        text: ", 2D",
                                                        style: CustomTextStyles
                                                            .titleMediumWhite)
                                                  ]),
                                                ),
                                                SizedBox(height: 16.v),
                                                Text("Билеты",
                                                    style: CustomTextStyles
                                                        .titleRus),
                                                SizedBox(height: 8.v),
                                                Container(
                                                    width: 359.h,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 12.v,
                                                            horizontal: 8.h),
                                                    decoration: AppDecoration
                                                        .fillOnPrimary
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder12),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: widget
                                                          .selectedTikets
                                                          .map<Widget>((seat) =>
                                                              buildTextRow(seat
                                                                  .toString()))
                                                          .toList(),
                                                    )),
                                                SizedBox(height: 16.v),
                                                Text("Онлайн-бар",
                                                    style: CustomTextStyles
                                                        .titleRus),
                                                SizedBox(height: 8.v),
                                                Container(
                                                    width: 359.h,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 12.v,
                                                            horizontal: 8.h),
                                                    decoration: AppDecoration
                                                        .fillOnPrimary
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder12),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: widget
                                                          .selectedfood
                                                          .map<Widget>((seat) =>
                                                              buildTextRow(seat
                                                                  .toString()))
                                                          .toList(),
                                                    )),
                                                SizedBox(height: 16.v),
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "ИТОГО: ",
                                                        style: CustomTextStyles
                                                            .amoutSemiBoldWhite20),
                                                    TextSpan(
                                                        text: (widget
                                                                    .totalAmoutTickets +
                                                                widget
                                                                    .totalAmoutFood)
                                                            .toString(),
                                                        style: CustomTextStyles
                                                            .amoutSemiBoldOrange20),
                                                    TextSpan(
                                                        text: " руб.",
                                                        style: CustomTextStyles
                                                            .amoutSemiBoldOrange20)
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
                                                left: 20.h,
                                                right: 20.h,
                                                top: 20.v),
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
                                                      style: theme.textTheme
                                                          .bodyMedium),
                                                  SizedBox(height: 4.v),
                                                  CustomTextFormField(
                                                    controller:
                                                        _emailcontroller,
                                                    focusNode: emailFocusNode,
                                                    autofocus: false,
                                                    textStyle: const TextStyle(
                                                        color: Colors.black),
                                                    hintText:
                                                        "example@gmail.com",
                                                    textInputType: TextInputType
                                                        .emailAddress,
                                                    validator: (value) {
                                                      return !Validators
                                                              .isValidEmail(
                                                                  value!)
                                                          ? "Введите действительный Email"
                                                          : null;
                                                    },
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isEmailValid =
                                                            Validators
                                                                .isValidEmail(
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
                                                      builder: (context,
                                                          wantNewsInfo) {
                                                        return CustomCheckboxButton(
                                                            text:
                                                                "Принимаю условия покупки билетов и товаров",
                                                            isExpandedText:
                                                                true,
                                                            value: wantNewsInfo,
                                                            checkColor: theme
                                                                .colorScheme
                                                                .primary,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 4.h,
                                                                    top: 33.v,
                                                                    right:
                                                                        28.h),
                                                            onChange: (value) {
                                                              context
                                                                  .read<
                                                                      AuthenticationBloc>()
                                                                  .add(ChangeCheckBoxEvent(
                                                                      value:
                                                                          value));
                                                              wantNewsInfo1 =
                                                                  value;
                                                            });
                                                      }),
                                                  if (widget.movieData[
                                                          "age_rating"] ==
                                                      18)
                                                    Text(
                                                        "ВАЖНО! Уважаемые гости, фильм относится к категории 18+. Лица моложе 18 лет не будут допущены на сеанс даже в сопровождении взрослых. Сотрудники вправе попросить предъявить удостоверение личности (оригинал).",
                                                        maxLines: 6,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: CustomTextStyles
                                                            .titleSmallGray),
                                                  SizedBox(height: 16.v),
                                                  CustomElevatedButton(
                                                      width: 353.h,
                                                      text: "Продолжить",
                                                      buttonStyle: _emailcontroller
                                                                  .text
                                                                  .isNotEmpty &&
                                                              wantNewsInfo1
                                                          ? ElevatedButton
                                                              .styleFrom(
                                                              backgroundColor:
                                                                  theme
                                                                      .colorScheme
                                                                      .primary,
                                                            )
                                                          : CustomButtonStyles
                                                              .fillGray,
                                                      onTap: () {
                                                        if (_emailcontroller
                                                                .text
                                                                .isNotEmpty &&
                                                            wantNewsInfo1) {
                                                          email =
                                                              _emailcontroller
                                                                  .text;
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => Payment(
                                                                  movieData: widget
                                                                      .movieData,
                                                                  hall: widget
                                                                      .hall,
                                                                  selectedDate:
                                                                      widget
                                                                          .selectedDate,
                                                                  selectedTime:
                                                                      widget
                                                                          .selectedTime,
                                                                  email: email,
                                                                  totalAmoutFood:
                                                                      widget
                                                                          .totalAmoutFood,
                                                                  selectedTikets:
                                                                      widget
                                                                          .selectedTikets,
                                                                  totalAmoutTickets:
                                                                      widget
                                                                          .totalAmoutTickets,
                                                                  selectedfood:
                                                                      widget
                                                                          .selectedfood,
                                                                  selectedId: widget
                                                                      .selectedId,
                                                                  id_show: widget.id_show),
                                                            ),
                                                          );
                                                        } else {
                                                          null;
                                                        }
                                                      },
                                                      alignment:
                                                          Alignment.center),
                                                  SizedBox(height: 16.v),
                                                ]))
                                      ])))
                        ]))))));
  }

  Widget buildTextRow(String text) {
    List<String> splitText = text.split('  ');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var str in splitText)
          Column(children: [
            Text(
              str.length > 19 ? str.substring(0, 18) + "..." : str,
              style: CustomTextStyles.bodyLargeWhite,
            ),
          ])
      ],
    );
  }
}
