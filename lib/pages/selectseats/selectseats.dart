import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
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
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
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
                          GoRouter.of(context).push(AppRoutes.homepage);
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
                      Expanded(
                          child: SingleChildScrollView(
                              padding: EdgeInsets.only(top: 20.v),
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.h),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                padding:
                                                    EdgeInsets.only(left: 20.h),
                                                child: IntrinsicWidth(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                              padding:
                                                              EdgeInsets.symmetric(
                                                                  horizontal: 13.h,
                                                                  vertical: 1.v),
                                                              decoration: AppDecoration
                                                                  .fillPrimaryContainer
                                                                  .copyWith(
                                                                  borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder12),
                                                              child: Text("lbl_142",
                                                                  style: CustomTextStyles
                                                                      .bodyLargeWhite)),
                                                        ])))),
                                        SizedBox(height: 20.v),
                                        Container(
                                            height: 18.v,
                                            width: 353.h,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.vertical(
                                                    bottom: Radius.circular(10.h)),
                                                gradient: LinearGradient(
                                                    begin: Alignment(0.5, 0),
                                                    end: Alignment(0.5, 1),
                                                    colors: [
                                                      appTheme.black
                                                          .withOpacity(0.75),
                                                      appTheme.black
                                                          .withOpacity(0.75)
                                                    ]))),
                                        Divider(),
                                        SizedBox(height: 30.v),
                                        Opacity(
                                            opacity: 0.9,
                                            child: Text("lbl41".toUpperCase(),
                                                style: CustomTextStyles
                                                    .bodyMediumWhite)),
                                        SizedBox(height: 41.v),
                                        SizedBox(
                                            height: 320.v,
                                            width: double.maxFinite,
                                            child: Stack(
                                                alignment: Alignment.bottomCenter,
                                                children: [
                                                  Align(
                                                      alignment: Alignment.center,
                                                      child: Padding(
                                                          padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 33.h),
                                                          child: Column(
                                                              mainAxisSize:
                                                              MainAxisSize.min,
                                                              children: [
                                                                Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath:
                                                                          ImageConstant
                                                                              .imgSeat,
                                                                          height: 24
                                                                              .adaptSize,
                                                                          width: 24
                                                                              .adaptSize),
                                                                      CustomImageView(
                                                                          svgPath:
                                                                          ImageConstant
                                                                              .imgSeat,
                                                                          height: 24
                                                                              .adaptSize,
                                                                          width: 24
                                                                              .adaptSize,
                                                                          margin: EdgeInsets.only(
                                                                              left:
                                                                              4.h)),
                                                                      CustomImageView(
                                                                          svgPath:
                                                                          ImageConstant
                                                                              .imgSeat,
                                                                          height: 24
                                                                              .adaptSize,
                                                                          width: 24
                                                                              .adaptSize,
                                                                          margin: EdgeInsets.only(
                                                                              left:
                                                                              4.h)),
                                                                      Opacity(
                                                                          opacity:
                                                                          0.3,
                                                                          child: CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h))),
                                                                      Opacity(
                                                                          opacity:
                                                                          0.3,
                                                                          child: CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h))),
                                                                      Opacity(
                                                                          opacity:
                                                                          0.3,
                                                                          child: CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h)))
                                                                    ]),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                        left: 35
                                                                            .h,
                                                                        top:
                                                                        8.v,
                                                                        right: 35
                                                                            .h),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                        children: [
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width:
                                                                              24.adaptSize),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 22.h)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 22.h))
                                                                        ])),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                        left: 35
                                                                            .h,
                                                                        top:
                                                                        8.v,
                                                                        right: 35
                                                                            .h),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                        children: [
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width:
                                                                              24.adaptSize),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 22.h)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h)),
                                                                          Opacity(
                                                                              opacity:
                                                                              0.3,
                                                                              child: CustomImageView(
                                                                                  svgPath: ImageConstant.imgSeat,
                                                                                  height: 24.adaptSize,
                                                                                  width: 24.adaptSize,
                                                                                  margin: EdgeInsets.only(left: 4.h))),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 4.h)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgSeat,
                                                                              height: 24
                                                                                  .adaptSize,
                                                                              width: 24
                                                                                  .adaptSize,
                                                                              margin:
                                                                              EdgeInsets.only(left: 22.h))
                                                                        ])),
                                                                SizedBox(
                                                                    height: 46.v),
                                                                Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Container(
                                                                          height: 8
                                                                              .adaptSize,
                                                                          width: 8
                                                                              .adaptSize,
                                                                          margin: EdgeInsets.only(
                                                                              top: 4
                                                                                  .v,
                                                                              bottom: 5
                                                                                  .v),
                                                                          decoration: BoxDecoration(
                                                                              color: appTheme
                                                                                  .blueGray100,
                                                                              borderRadius:
                                                                              BorderRadius.circular(4.h))),
                                                                      Opacity(
                                                                          opacity:
                                                                          0.9,
                                                                          child: Padding(
                                                                              padding: EdgeInsets.only(
                                                                                  left: 9
                                                                                      .h),
                                                                              child: Text(
                                                                                  "lbl42",
                                                                                  style: CustomTextStyles.bodySmallWhiteLight))),
                                                                      Spacer(
                                                                          flex: 50),
                                                                      Container(
                                                                          height: 8
                                                                              .adaptSize,
                                                                          width: 8
                                                                              .adaptSize,
                                                                          margin: EdgeInsets.only(
                                                                              top: 4
                                                                                  .v,
                                                                              bottom: 5
                                                                                  .v),
                                                                          decoration: BoxDecoration(
                                                                              color: appTheme
                                                                                  .gray700,
                                                                              borderRadius:
                                                                              BorderRadius.circular(4.h))),
                                                                      Opacity(
                                                                          opacity:
                                                                          0.9,
                                                                          child: Padding(
                                                                              padding: EdgeInsets.only(
                                                                                  left: 9
                                                                                      .h),
                                                                              child: Text(
                                                                                  "lbl43",
                                                                                  style: CustomTextStyles.bodySmallWhiteLight))),
                                                                      Spacer(
                                                                          flex: 50),
                                                                      Container(
                                                                          height: 8
                                                                              .adaptSize,
                                                                          width: 8
                                                                              .adaptSize,
                                                                          margin: EdgeInsets.only(
                                                                              top: 4
                                                                                  .v,
                                                                              bottom: 5
                                                                                  .v),
                                                                          decoration: BoxDecoration(
                                                                              color: theme
                                                                                  .colorScheme
                                                                                  .errorContainer,
                                                                              borderRadius:
                                                                              BorderRadius.circular(4.h))),
                                                                      Opacity(
                                                                          opacity:
                                                                          0.9,
                                                                          child: Padding(
                                                                              padding: EdgeInsets.only(
                                                                                  left: 9
                                                                                      .h),
                                                                              child: Text(
                                                                                  "lbl44",
                                                                                  style: CustomTextStyles.bodySmallWhiteLight)))
                                                                    ])
                                                              ]))),
                                                  CustomImageView(
                                                      imagePath:
                                                      ImageConstant.imgGroup57,
                                                      height: 32.v,
                                                      width: 393.h,
                                                      alignment:
                                                      Alignment.bottomCenter)
                                                ])),
                                        SizedBox(height: 15.v),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 13.v),
                                            decoration: AppDecoration.fillOnPrimary
                                                .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder12),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text("lbl45",
                                                      style: CustomTextStyles
                                                          .titleSmallWhite),
                                                  SizedBox(height: 14.v),
                                                  Divider(),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20.h,
                                                          top: 23.v,
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
                                                  Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          20.h, 14.v, 20.h, 3.v),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Text("lbl_5_6",
                                                                style: CustomTextStyles
                                                                    .bodyLargeWhite),
                                                            Text("lbl_390",
                                                                style: CustomTextStyles
                                                                    .bodyLargeWhite)
                                                          ]))
                                                ]))
                                      ]))))
                    ])))));
  }
}
