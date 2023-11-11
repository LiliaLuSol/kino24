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
  Widget buildMoviesGrid(List<dynamic> movieList) {
    List<bool> selectedDates =
        List.generate(movieList.length, (index) => false);

    void updateSelectedDate(int index) {
      setState(() {
        for (int i = 0; i < selectedDates.length; i++) {
          selectedDates[i] = i == index;
        }
      });
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1,
        crossAxisSpacing: 16.h,
        mainAxisSpacing: 16.h,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: movieList.length,
      itemBuilder: (BuildContext ctx, index) {
        String dateStr = movieList[index]["date"];
        DateTime dateTime = DateTime.parse(dateStr);
        String formattedDate = DateFormat.yMMMMd('ru').format(dateTime);
        // return Wrap(
        //     spacing: 8.0,
        //     children: List.generate(movieList.length, (index) {
              return
                // ChoiceChip(
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 1.v),
                  decoration: AppDecoration.fillPrimaryContainer
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                  alignment: Alignment.center,
                  child:
                // backgroundColor: theme.colorScheme.secondary,
                // selectedColor: theme.colorScheme.primary,
                // label:
                Text(
                    formattedDate.substring(0, formattedDate.indexOf(' 202')),
                    style: CustomTextStyles.bodyLargeWhite),
                // onSelected: (isSelected) {
                //   updateSelectedDate(index);
                // },
                // selected: selectedDates[index],
              );
            // }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    Future<dynamic> getDateSelectSeats() async {
      List<dynamic> moviesList = await supabase
          .from("selectmovie")
          .select<List<dynamic>>()
          .eq("movie_id", widget.movieData["movie_id"]);
      return moviesList;
    }

    Future<dynamic> getDateShow() async {
      List<dynamic> moviesList = await supabase
          .from("Showtimes_date")
          .select<List<dynamic>>()
          .eq("movie_id", widget.movieData["movie_id"]);
      return moviesList;
    }

    Future<dynamic> getTimeShow() async {
      List<dynamic> moviesList = await supabase
          .from("Showtimes_time")
          .select<List<dynamic>>()
          .eq("movie_id", widget.movieData["movie_id"]);
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
                                children: [
                                  Expanded(
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                FutureBuilder(
                                                  future: getDateShow(),
                                                  builder: (context, snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.done) {
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
                                                  },
                                                ),
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
                                        // Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment
                                        //             .center,
                                        //     children: [
                                        //       CustomImageView(
                                        //           svgPath:
                                        //               ImageConstant
                                        //                   .imgSeat,
                                        //           height: 24
                                        //               .adaptSize,
                                        //           width: 24
                                        //               .adaptSize),
                                        //       CustomImageView(
                                        //           svgPath:
                                        //               ImageConstant
                                        //                   .imgSeat,
                                        //           height: 24
                                        //               .adaptSize,
                                        //           width: 24
                                        //               .adaptSize,
                                        //           margin: EdgeInsets
                                        //               .only(
                                        //                   left:
                                        //                       4.h)),
                                        //       CustomImageView(
                                        //           svgPath:
                                        //               ImageConstant
                                        //                   .imgSeat,
                                        //           height: 24
                                        //               .adaptSize,
                                        //           width: 24
                                        //               .adaptSize,
                                        //           margin: EdgeInsets
                                        //               .only(
                                        //                   left:
                                        //                       4.h)),
                                        //       Opacity(
                                        //           opacity: 0.3,
                                        //           child: CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h))),
                                        //       Opacity(
                                        //           opacity: 0.3,
                                        //           child: CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h))),
                                        //       Opacity(
                                        //           opacity: 0.3,
                                        //           child: CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h)))
                                        //     ]),
                                        // Padding(
                                        //     padding:
                                        //         EdgeInsets.only(
                                        //             left: 35.h,
                                        //             top: 8.v,
                                        //             right:
                                        //                 35.h),
                                        //     child: Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment
                                        //                 .center,
                                        //         children: [
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       22.h)),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h)),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h)),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h)),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h)),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h)),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       22.h))
                                        //         ])),
                                        // Padding(
                                        //     padding:
                                        //         EdgeInsets.only(
                                        //             left: 35.h,
                                        //             top: 8.v,
                                        //             right:
                                        //                 35.h),
                                        //     child: Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment
                                        //                 .center,
                                        //         children: [
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       22.h)),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h)),
                                        //           Opacity(
                                        //               opacity:
                                        //                   0.3,
                                        //               child: CustomImageView(
                                        //                   svgPath: ImageConstant
                                        //                       .imgSeat,
                                        //                   height: 24
                                        //                       .adaptSize,
                                        //                   width: 24
                                        //                       .adaptSize,
                                        //                   margin:
                                        //                       EdgeInsets.only(left: 4.h))),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h)),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h)),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       4.h)),
                                        //           CustomImageView(
                                        //               svgPath:
                                        //                   ImageConstant
                                        //                       .imgSeat,
                                        //               height: 24
                                        //                   .adaptSize,
                                        //               width: 24
                                        //                   .adaptSize,
                                        //               margin: EdgeInsets.only(
                                        //                   left:
                                        //                       22.h))
                                        //         ])),
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
                            SizedBox(height: 15.v),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 13.v),
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
                                      SizedBox(height: 14.v),
                                      Divider(
                                          height: 1,
                                          thickness: 0.8,
                                          color: appTheme.whiteP70),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.h,
                                              top: 20.v,
                                              right: 20.h),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_5_5",
                                                    style: CustomTextStyles
                                                        .bodyLargeWhite),
                                                Text("lbl_390",
                                                    style: CustomTextStyles
                                                        .bodyLargeWhite)
                                              ])),
                                    ])),
                            SizedBox(height: 16.v),
                            CustomElevatedButton(
                                width: 353.h,
                                text: "Продолжить",
                                buttonStyle: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.primary,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectFood(
                                          movieData: widget.movieData),
                                    ),
                                  );
                                },
                                alignment: Alignment.center),
                            SizedBox(height: 16.v),
                          ])))
                    ])))));
  }
}

// Widget buildMoviesGrid(List<dynamic> movieList) {
//   List<bool> selectedDates = List.generate(movieList.length, (index) => false);
//
//   void updateSelectedDate(int index) {
//     setState(() {
//       for (int i = 0; i < selectedDates.length; i++) {
//         selectedDates[i] = i == index;
//       }
//     });
//   }
//
//   return GridView.builder(
//     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//       maxCrossAxisExtent: 200,
//       childAspectRatio: 0.8,
//       crossAxisSpacing: 16.h,
//       mainAxisSpacing: 16.h,
//     ),
//     shrinkWrap: true,
//     scrollDirection: Axis.horizontal,
//     itemCount: movieList.length,
//     itemBuilder: (BuildContext ctx, index) {
//       String dateStr = movieList[index]["date"];
//       DateTime dateTime = DateTime.parse(dateStr);
//       String formattedDate = DateFormat.yMMMMd('ru').format(dateTime);
//       return Column(children: [
//         ChoiceChip(
//         // Container(
//         //   // padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 1.v),
//         //   // decoration: AppDecoration.fillPrimaryContainer
//         //   //     .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
//         //   alignment: Alignment.center,
//         //   child:
//         backgroundColor: Colors.transparent,
// selectedColor: theme.colorScheme.secondary,
//          label: Text(formattedDate.substring(0, formattedDate.indexOf(' 202')),
//               style: CustomTextStyles.bodyLargeWhite),
//           onSelected: (isSelected) {
//             updateSelectedDate(index);
//           },
//           selected: selectedDates[index],
//         )
//       ]);
//     },
//   );
// }
