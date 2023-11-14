import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kino24/main.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/selectfood/selectfood.dart';
import 'package:kino24/widgets/app_bar/appbar_iconbutton.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';

class SelectSeats extends StatefulWidget {
  final dynamic movieData;

  const SelectSeats({super.key, required this.movieData});

  @override
  _SelectSeatsState createState() => _SelectSeatsState();
}

class _SelectSeatsState extends State<SelectSeats> {
  int DateIndex = 0;
  int TimeIndex = 0;
  int hall = 0;
  String? selectedDate;
  String? selectedTime;
  int totalAmountTickets = 0;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    Future<dynamic> getDateShow() async {
      List<dynamic> moviesList = await supabase
          .from("Showtimes_date")
          .select<List<dynamic>>()
          .eq("movie_id", widget.movieData["movie_id"])
          .limit(7);
      return moviesList;
    }

    Future<dynamic> getTimeShow() async {
      List<dynamic> moviesList = await supabase
          .from("Showtimes_time")
          .select<List<dynamic>>()
          .eq("showtime_date_id", DateIndex);
      return moviesList;
    }

    Future<dynamic> getSelectShow() async {
      List<dynamic> moviesList = await supabase
          .from("av_seat_show")
          .select<List<dynamic>>()
          .eq("id_show_time", TimeIndex)
          .order("id_seat", ascending: true);
      return moviesList;
    }

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
                        text: "Выбор места",
                        margin: EdgeInsets.only(left: 16.h))
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
                // color: appTheme.white,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(
                        height: 75.v,
                      ),
                      Divider(
                          height: 1, thickness: 0.8, color: appTheme.whiteP70),
                      Container(
                        height: 135.v,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 16.v),
                                  Expanded(
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FutureBuilder(
                                                    future: getDateShow(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .done) {
                                                        if (snapshot.hasData) {
                                                          final movie =
                                                              snapshot.data!;
                                                          return buildMoviesGrid(
                                                              movie);
                                                        } else {
                                                          return const Center(
                                                              child: Text(
                                                                  "Нет данных"));
                                                        }
                                                      } else if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      } else {
                                                        return const Center(
                                                            child: Text(
                                                                "Произошла ошибка"));
                                                      }
                                                    })
                                              ]))),
                                  SizedBox(height: 12.v),
                                  Expanded(
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FutureBuilder(
                                                    future: getTimeShow(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .done) {
                                                        if (snapshot.hasData) {
                                                          final movie =
                                                              snapshot.data!;
                                                          return buildMoviesGrid1(
                                                              movie);
                                                        } else {
                                                          return const Center(
                                                              child: Text(
                                                                  "Нет данных"));
                                                        }
                                                      } else if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      } else {
                                                        return const Center(
                                                            child: Text(
                                                                "Произошла ошибка"));
                                                      }
                                                    })
                                              ]))),
                                  SizedBox(height: 20.v),
                                ])),
                      ),
                      Divider(
                          height: 1, thickness: 0.8, color: appTheme.whiteP70),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                            Container(
                              height: 18.v,
                              width: 353.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12.h),
                                    bottomLeft: Radius.circular(12.h)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      appTheme.black.withOpacity(0.75),
                                      appTheme.white.withOpacity(0.75)
                                    ]),
                              ),
                            ),
                            SizedBox(height: 16.v),
                            Center(
                                child: Text("Экран".toUpperCase(),
                                    style: CustomTextStyles.bodyMediumWhite)),
                            SizedBox(height: 41.v),
                            Column(children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FutureBuilder(
                                            future: getSelectShow(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.done) {
                                                if (snapshot.hasData) {
                                                  final movie = snapshot.data!;
                                                  return buildMoviesGrid2(
                                                      movie);
                                                } else {
                                                  return const Center(
                                                      child:
                                                          Text("Нет данных"));
                                                }
                                              } else if (snapshot
                                                      .connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              } else {
                                                return const Center(
                                                    child: Text(
                                                        "Произошла ошибка"));
                                              }
                                            }),
                                        SizedBox(height: 46.v),
                                        Divider(
                                            height: 1,
                                            thickness: 0.8,
                                            color: appTheme.whiteP70),
                                        SizedBox(height: 8.v),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 32.h),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      height: 8.adaptSize,
                                                      width: 8.adaptSize,
                                                      margin: EdgeInsets.only(
                                                          top: 4.v,
                                                          bottom: 5.v),
                                                      decoration: BoxDecoration(
                                                          color: appTheme
                                                              .blueGray100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.h))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 9.h),
                                                      child: Text("Свободно",
                                                          style: CustomTextStyles
                                                              .bodySmallWhiteLight)),
                                                  Spacer(flex: 50),
                                                  Container(
                                                      height: 8.adaptSize,
                                                      width: 8.adaptSize,
                                                      margin: EdgeInsets.only(
                                                          top: 4.v,
                                                          bottom: 5.v),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              appTheme.gray700,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.h))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 9.h),
                                                      child: Text("Занято",
                                                          style: CustomTextStyles
                                                              .bodySmallWhiteLight)),
                                                  Spacer(flex: 50),
                                                  Container(
                                                      height: 8.adaptSize,
                                                      width: 8.adaptSize,
                                                      margin: EdgeInsets.only(
                                                          top: 4.v,
                                                          bottom: 5.v),
                                                      decoration: BoxDecoration(
                                                          color: theme
                                                              .colorScheme
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.h))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 9.h),
                                                      child: Text("Выбрано",
                                                          style: CustomTextStyles
                                                              .bodySmallWhiteLight))
                                                ]))
                                      ])),
                              SizedBox(height: 8.v),
                              Divider(
                                  height: 1,
                                  thickness: 0.8,
                                  color: appTheme.whiteP70),
                            ]),
                            SizedBox(height: 16.v),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 16.v),
                                decoration: AppDecoration.fillOnPrimary
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder12),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Ваши места",
                                          style: CustomTextStyles.boldWhite20),
                                      SizedBox(height: 16.v),
                                      Divider(
                                          height: 1,
                                          thickness: 0.8,
                                          color: appTheme.whiteP70),
                                      SizedBox(height: 16.v),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.h),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: selectedSeats
                                                .map((seat) => buildTextRow(
                                                    seat.toString()))
                                                .toList(),
                                          )),
                                    ])),
                            SizedBox(height: 16.v),
                            CustomElevatedButton(
                                width: 353.h,
                                text: "Продолжить",
                                buttonStyle: !selectedSeats.isEmpty
                                    ? ElevatedButton.styleFrom(
                                        backgroundColor:
                                            theme.colorScheme.primary)
                                    : CustomButtonStyles.fillGray,
                                onTap: () {
                                  !selectedSeats.isEmpty
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SelectFood(
                                                movieData: widget.movieData,
                                                hall: hall,
                                                selectedDate: selectedDate,
                                                selectedTime: selectedTime,
                                                selectedTikets: selectedSeats,
                                                totalAmoutTickets:
                                                    totalAmountTickets),
                                          ),
                                        )
                                      : null;
                                },
                                alignment: Alignment.center),
                            SizedBox(height: 16.v),
                          ])))
                    ])))));
  }

  Widget buildMoviesGrid(List<dynamic> movieList) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16.h,
            mainAxisSpacing: 16.h,
            mainAxisExtent: 100.h),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (BuildContext ctx, index) {
          String dateStr = movieList[index]["date"];
          DateTime dateTime = DateTime.parse(dateStr);
          String formattedDate = DateFormat.yMMMMd('ru').format(dateTime);
          return DateWidget(
              formattedDate.substring(0, formattedDate.indexOf(' 202')),
              isSelected: selectedDate == formattedDate, onSelect: () {
            setState(() {
              selectedDate = formattedDate;
              DateIndex = movieList[index]["showtime_date_id"];
              selectedTime = null;
              TimeIndex = 0;
              clearSelections();
            });
          });
        });
  }

  Widget buildMoviesGrid1(List<dynamic> movieList) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16.h,
          mainAxisSpacing: 16.h,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (BuildContext ctx, index) {
          String timeStr = movieList[index]["time"];
          String formattedTime =
              DateFormat.Hm().format(DateFormat.Hms().parse(timeStr));
          return TimeWidget(formattedTime,
              isSelected: selectedTime == formattedTime, onSelect: () {
            setState(() {
              selectedTime = formattedTime;
              TimeIndex = movieList[index]["showtime_time_id"];
              hall = movieList[index]["theater_hall"];
              clearSelections();
            });
          });
        });
  }

  List<dynamic> selectedSeats = [];

  void selectSeat(String seat, int cost) {
    if (!selectedSeats.contains(seat)) {
      setState(() {
        selectedSeats.add(seat);
        totalAmountTickets += cost;
      });
    } else {
      setState(() {
        selectedSeats.remove(seat);
        totalAmountTickets -= cost;
      });
    }
  }

  void clearSelections() {
    setState(() {
      selectedSeats.clear();
    });
  }

  Widget buildMoviesGrid2(List<dynamic> seatStatusList) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: seatStatusList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 9,
          crossAxisSpacing: 2.h,
          mainAxisSpacing: 2.h,
          mainAxisExtent: 35.v),
      itemBuilder: (BuildContext context, int index) {
        bool isAvailable = seatStatusList[index]['available'];
        int row = ((index + 1) ~/ 9) + 1;
        int column = (index + 1) % 9;
        if (column == 0) {
          column = 9;
        } else {
          column;
        }
        ;
        int cost = 0;
        if (row <= 3 ||
            column == 1 ||
            column == 2 ||
            column == 8 ||
            column == 9) {
          cost = 390;
        } else {
          cost = 420;
        }
        String seat = "Ряд $row Место $column  $cost руб.";
        bool isSelected = selectedSeats.contains(seat);
        return InkWell(
          onTap: () {
            isAvailable ? selectSeat(seat, cost) : null;
          },
          child: buildSeatWidget(isAvailable, isSelected),
        );
      },
    );
  }

  Widget buildSeatWidget(bool isAvailable, bool isSelected) {
    if (isAvailable) {
      if (isSelected) {
        return CustomImageView(
          svgPath: ImageConstant.imgSeatPrimary,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.only(left: 4.h),
        );
      } else {
        return CustomImageView(
          svgPath: ImageConstant.imgSeat,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.only(left: 4.h),
        );
      }
    } else {
      return Opacity(
        opacity: 0.3,
        child: CustomImageView(
          svgPath: ImageConstant.imgSeat,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.only(left: 4.h),
        ),
      );
    }
  }

  Widget buildTextRow(String text) {
    List<String> splitText = text.split('  ');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var str in splitText)
          Column(children: [
            Text(
              str,
              style: CustomTextStyles.bodyLargeWhite,
            ),
          ])
      ],
    );
  }
}

class DateWidget extends StatelessWidget {
  final String formattedDate;
  final bool isSelected;
  final VoidCallback onSelect;

  DateWidget(this.formattedDate,
      {required this.isSelected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.roundedBorder12,
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.primaryContainer,
        ),
        alignment: Alignment.center,
        child: Text(
          formattedDate,
          style: CustomTextStyles.bodyLargeWhite,
        ),
      ),
    );
  }
}

class TimeWidget extends StatelessWidget {
  final String formattedDate;
  final bool isSelected;
  final VoidCallback onSelect;

  TimeWidget(this.formattedDate,
      {required this.isSelected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.roundedBorder12,
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.primaryContainer,
        ),
        alignment: Alignment.center,
        child: Text(
          formattedDate,
          style: CustomTextStyles.bodyLargeWhite,
        ),
      ),
    );
  }
}
