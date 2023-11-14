import 'package:flutter/material.dart';
import 'package:kino24/main.dart';
import 'package:kino24/other/app_export.dart';

class Payment extends StatefulWidget {
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
  final String email;

  const Payment(
      {super.key,
      required this.movieData,
      required this.hall,
      required this.selectedDate,
      required this.selectedTime,
      required this.selectedTikets,
      required this.totalAmoutTickets,
      required this.totalAmoutFood,
      required this.selectedfood,
      required this.selectedId,
      required this.id_show,
      required this.email});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? getEmail() {
    final currentUser = supabase.auth.currentUser;
    if (currentUser != null) {
      final email = currentUser.email!;
      return email;
    } else {
      return "Ваш email скоро здесь появится...";
    }
  }

  void saveSeat() async {
    try {
      final res = await supabase.from('users_tickets').select().execute();
      String? email = getEmail();
      for (String item in widget.selectedTikets) {
        final seat = item.substring(0, item.indexOf('  '));
        final count = res.data.length;
        int countNew = count + 1;
        email = email.toString();
        supabase.from('users_tickets').upsert({
          'id': countNew,
          'user': email.toString(),
          'seat': seat.toString(),
          'hall': widget.hall.toString(),
          'movie': widget.movieData["title_rus"].toString(),
          'date': widget.selectedDate.toString(),
          'time': widget.selectedTime.toString()
        });
      }
    } catch (error) {
      print('Ошибка при выполнении запроса: $error');
    }
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
                                              Text("Дата и время сеанса:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: widget.selectedDate,
                                                      style: CustomTextStyles
                                                          .bodyLargeWhite),
                                                  TextSpan(
                                                      text: " в ",
                                                      style: CustomTextStyles
                                                          .bodyLargeWhite),
                                                  TextSpan(
                                                      text: widget.selectedTime,
                                                      style: CustomTextStyles
                                                          .bodyLargeWhite)
                                                ]),
                                              ),
                                              SizedBox(height: 16.v),
                                              Text("Зал:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Зал: ",
                                                    style: CustomTextStyles
                                                        .bodyLargeWhite),
                                                TextSpan(
                                                    text:
                                                        widget.hall.toString(),
                                                    style: CustomTextStyles
                                                        .bodyLargeWhite)
                                              ])),
                                              SizedBox(height: 16.v),
                                              Text("Места:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: widget.selectedTikets
                                                    .map<Widget>((seat) =>
                                                        buildTextRow(
                                                            seat.toString()))
                                                    .toList(),
                                              ),
                                              SizedBox(height: 16.v),
                                              Text("Онлайн-бар:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: widget.selectedfood
                                                    .map<Widget>((seat) =>
                                                        buildTextRow(
                                                            seat.toString()))
                                                    .toList(),
                                              ),
                                              SizedBox(height: 16.v),
                                              Text("Email:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              Text(
                                                widget.email,
                                                style: CustomTextStyles
                                                    .bodyLargeOrage,
                                                maxLines: 3,
                                              ),
                                              SizedBox(height: 16.v),
                                              Text("К оплате:",
                                                  style: CustomTextStyles
                                                      .titleMedium16),
                                              RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: (widget
                                                                  .totalAmoutFood +
                                                              widget
                                                                  .totalAmoutTickets)
                                                          .toString(),
                                                      style: CustomTextStyles
                                                          .bodyLargeWhite),
                                                  TextSpan(
                                                      text: " руб.",
                                                      style: CustomTextStyles
                                                          .bodyLargeWhite)
                                                ]),
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
                                                  onTap: ()  async {
                                                    try {
                                                      supabase
                                                          .from('av_seat_show')
                                                          .update({
                                                        'available': false
                                                      })
                                                          .eq('id_show_time',
                                                          widget.id_show)
                                                          .in_('id_seat',
                                                          widget.selectedId)
                                                          .execute();
                                                      saveSeat();
                                                      try {
                                                        String? email = getEmail();
                                                        for (String item in widget.selectedTikets) {
                                                          final seat = item.substring(0, item.indexOf('  '));
                                                          final res = await supabase.from('users_tickets').select().execute();
                                                          int count = res.data.length;
                                                          int countNew = count + 1;
                                                          email = email.toString();
                                                          await supabase.from('users_tickets').insert({
                                                            'id': countNew,
                                                            'user': email.toString(),
                                                            'seat': seat.toString(),
                                                            'hall': widget.hall.toString(),
                                                            'movie': widget.movieData["title_rus"].toString(),
                                                            'date': widget.selectedDate.toString(),
                                                            'time': widget.selectedTime.toString()
                                                          });
                                                        }
                                                        GoRouter.of(context).push(
                                                            AppRoutes.homepage);
                                                      } catch (error) {
                                                        print('Ошибка при выполнении запроса: $error');
                                                      }
                                                    } catch (e) {
                                                      print(
                                                          'Ошибка: $e');
                                                    }
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
                                                  onTap: ()  async {
                                                    try {
                                                      supabase
                                                          .from('av_seat_show')
                                                          .update({
                                                            'available': false
                                                          })
                                                          .eq('id_show_time',
                                                              widget.id_show)
                                                          .in_('id_seat',
                                                              widget.selectedId)
                                                          .execute();
                                                      saveSeat();
                                                      try {
                                                        String? email = getEmail();
                                                        for (String item in widget.selectedTikets) {
                                                          final seat = item.substring(0, item.indexOf('  '));
                                                          final res = await supabase.from('users_tickets').select().execute();
                                                          int count = res.data.length;
                                                          int countNew = count + 1;
                                                          email = email.toString();
                                                          await supabase.from('users_tickets').insert({
                                                            'id': countNew,
                                                            'user': email.toString(),
                                                            'seat': seat.toString(),
                                                            'hall': widget.hall.toString(),
                                                            'movie': widget.movieData["title_rus"].toString(),
                                                            'date': widget.selectedDate.toString(),
                                                            'time': widget.selectedTime.toString()
                                                          });
                                                        }
                                                        GoRouter.of(context).push(
                                                            AppRoutes.homepage);
                                                      } catch (error) {
                                                        print('Ошибка при выполнении запроса: $error');
                                                      }
                                                    } catch (e) {
                                                      print(
                                                          'Ошибка: $e');
                                                    }
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