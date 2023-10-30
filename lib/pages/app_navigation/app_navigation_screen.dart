// import 'bloc/app_navigation_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'models/app_navigation_model.dart';
// import 'package:flutter/material.dart';
// import 'package:kino24/other/app_export.dart';
//
// class AppNavigationScreen extends StatelessWidget {
//   const AppNavigationScreen({Key? key}) : super(key: key);
//
//   static Widget builder(BuildContext context) {
//     return BlocProvider<AppNavigationBloc>(
//         create: (context) => AppNavigationBloc(
//             AppNavigationState(appNavigationModelObj: AppNavigationModel()))
//           ..add(AppNavigationInitialEvent()),
//         child: AppNavigationScreen());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return BlocBuilder<AppNavigationBloc, AppNavigationState>(
//         builder: (context, state) {
//       return SafeArea(
//           child: Scaffold(
//               backgroundColor: appTheme.white,
//               body: SizedBox(
//                   width: 375.h,
//                   child: Column(children: [
//                     Container(
//                         decoration: AppDecoration.fillWhiteA,
//                         child: Column(children: [
//                           Align(
//                               alignment: Alignment.centerLeft,
//                               child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 20.h, vertical: 10.v),
//                                   child: Text("Навигация",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: appTheme.black,
//                                           fontSize: 20.fSize,
//                                           fontFamily: 'Open Sans',
//                                           fontWeight: FontWeight.w400)))),
//                           Align(
//                               alignment: Alignment.centerLeft,
//                               child: Padding(
//                                   padding: EdgeInsets.only(left: 20.h),
//                                   child: Text("msg_check_your_app_s",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: appTheme.blueGray400,
//                                           fontSize: 16.fSize,
//                                           fontFamily: 'Open Sans',
//                                           fontWeight: FontWeight.w400)))),
//                           SizedBox(height: 5.v),
//                           Divider(
//                               height: 1.v,
//                               thickness: 1.v,
//                               color: appTheme.black)
//                         ])),
//                     Expanded(
//                         child: SingleChildScrollView(
//                             child: Container(
//                                 decoration: AppDecoration.fillWhiteA,
//                                 child: Column(children: [
//                                   GestureDetector(
//                                       onTap: () {
//                                         onTapScreensaver(context);
//                                       },
//                                       child: Container(
//                                           decoration: AppDecoration.fillWhiteA,
//                                           child: Column(children: [
//                                             Align(
//                                                 alignment: Alignment.centerLeft,
//                                                 child: Padding(
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                             horizontal: 20.h,
//                                                             vertical: 10.v),
//                                                     child: Text(
//                                                         "screensaver",
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                         style: TextStyle(
//                                                             color: appTheme
//                                                                 .black,
//                                                             fontSize: 20.fSize,
//                                                             fontFamily:
//                                                                 'Roboto',
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w400)))),
//                                             SizedBox(height: 5.v),
//                                             Divider(
//                                                 height: 1.v,
//                                                 thickness: 1.v,
//                                                 color: appTheme.blueGray400)
//                                           ]))),
//                                   GestureDetector(
//                                       onTap: () {
//                                         onTapOnboardOne(context);
//                                       },
//                                       child: Container(
//                                           decoration: AppDecoration.fillWhiteA,
//                                           child: Column(children: [
//                                             Align(
//                                                 alignment: Alignment.centerLeft,
//                                                 child: Padding(
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                             horizontal: 20.h,
//                                                             vertical: 10.v),
//                                                     child: Text(
//                                                         "lbl_onboardone" ,
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                         style: TextStyle(
//                                                             color: appTheme
//                                                                 .black,
//                                                             fontSize: 20.fSize,
//                                                             fontFamily:
//                                                                 'Roboto',
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w400)))),
//                                             SizedBox(height: 5.v),
//                                             Divider(
//                                                 height: 1.v,
//                                                 thickness: 1.v,
//                                                 color: appTheme.blueGray400)
//                                           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapOnboardThree(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_onboardthree" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapAuthReg(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_auth_reg" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapTicketsactivContainer(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "msg_tickets_activ" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapProfileUser(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_profile_user" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapDescriptionOnFilm(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "msg_descriptiononfilm"
//                                 //                              ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapSelectSeats(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_selectseats" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapSelectFood(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_selectfood" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapResult(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text("lbl_result" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapPayment(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_payment" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapOnboardTwo(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_onboardtwo" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapAuthorization(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_authorization" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapRegistration(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_registration" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapTicketshistory(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_tickets_history"
//                                 //                              ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapProfilePassTabContainer(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "msg_profile_pass_tab"
//                                 //                              ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ]))),
//                                 //   GestureDetector(
//                                 //       onTap: () {
//                                 //         onTapSupport(context);
//                                 //       },
//                                 //       child: Container(
//                                 //           decoration: AppDecoration.fillWhiteA,
//                                 //           child: Column(children: [
//                                 //             Align(
//                                 //                 alignment: Alignment.centerLeft,
//                                 //                 child: Padding(
//                                 //                     padding:
//                                 //                         EdgeInsets.symmetric(
//                                 //                             horizontal: 20.h,
//                                 //                             vertical: 10.v),
//                                 //                     child: Text(
//                                 //                         "lbl_support" ,
//                                 //                         textAlign:
//                                 //                             TextAlign.center,
//                                 //                         style: TextStyle(
//                                 //                             color: appTheme
//                                 //                                 .black,
//                                 //                             fontSize: 20.fSize,
//                                 //                             fontFamily:
//                                 //                                 'Roboto',
//                                 //                             fontWeight:
//                                 //                                 FontWeight
//                                 //                                     .w400)))),
//                                 //             SizedBox(height: 5.v),
//                                 //             Divider(
//                                 //                 height: 1.v,
//                                 //                 thickness: 1.v,
//                                 //                 color: appTheme.blueGray400)
//                                 //           ])))
//                                 ]))))
//                   ]))));
//     });
//   }
//
//   /// Navigates to the screensaverScreen when the action is triggered.
//   ///
//   /// The [BuildContext] parameter is used to build the navigation stack.
//   /// When the action is triggered, this function uses the [NavigatorService]
//   /// to push the named route for the screensaverScreen.
//   onTapScreensaver(BuildContext context) {
//     NavigatorService.pushNamed(
//       AppRoutes.screensaver,
//     );
//   }
//
//   /// Navigates to the onboardoneScreen when the action is triggered.
//   ///
//   /// The [BuildContext] parameter is used to build the navigation stack.
//   /// When the action is triggered, this function uses the [NavigatorService]
//   /// to push the named route for the onboardoneScreen.
//   onTapOnboardOne(BuildContext context) {
//     NavigatorService.pushNamed(
//       AppRoutes.onboardone,
//     );
//   }
//   //
//   // /// Navigates to the onboardthreeScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the onboardthreeScreen.
//   // onTapOnboardThree(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.onboardthreeScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the authRegScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the authRegScreen.
//   // onTapAuthReg(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.authRegScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the ticketsActivContainerScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the ticketsActivContainerScreen.
//   // onTapTicketsactivContainer(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.ticketsActivContainerScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the profileUserScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the profileUserScreen.
//   // onTapProfileUser(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.profileUserScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the descriptiononfilmScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the descriptiononfilmScreen.
//   // onTapDescriptionOnFilm(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.descriptiononfilmScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the selectseatsScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the selectseatsScreen.
//   // onTapSelectSeats(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.selectseatsScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the selectfoodScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the selectfoodScreen.
//   // onTapSelectFood(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.selectfoodScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the resultScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the resultScreen.
//   // onTapResult(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.resultScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the paymentScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the paymentScreen.
//   // onTapPayment(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.paymentScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the onboardtwoScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the onboardtwoScreen.
//   // onTapOnboardTwo(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.onboardtwoScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the authorizationScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the authorizationScreen.
//   // onTapAuthorization(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.authorizationScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the registrationScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the registrationScreen.
//   // onTapRegistration(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.registrationScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the ticketsHistoryScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the ticketsHistoryScreen.
//   // onTapTicketshistory(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.ticketsHistoryScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the profilePassTabContainerScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the profilePassTabContainerScreen.
//   // onTapProfilePassTabContainer(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.profilePassTabContainerScreen,
//   //   );
//   // }
//   //
//   // /// Navigates to the supportScreen when the action is triggered.
//   // ///
//   // /// The [BuildContext] parameter is used to build the navigation stack.
//   // /// When the action is triggered, this function uses the [NavigatorService]
//   // /// to push the named route for the supportScreen.
//   // onTapSupport(BuildContext context) {
//   //   NavigatorService.pushNamed(
//   //     AppRoutes.supportScreen,
//   //   );
//   // }
// }
