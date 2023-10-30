import 'bloc/homepage_bloc.dart';
import 'models/homepage_model.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/app_bar/appbar_image.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/main.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<HomepageBloc>(
      create: (context) => HomepageBloc(HomepageState(
        homepageModelObj: HomepageModel(),
      ))
        ..add(HomepageInitialEvent()),
      child: Homepage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    // Future<List<Map<String, dynamic>>?> getMoviesData() async {
    //   final response = await supabase
    //       .from('Movies')
    //       .grpc('get_movie_data')
    //       .execute();
    //
    //   return response.data as List<Map<String, dynamic>>?;
    // }
    final _future = supabase.from('Movies').select<List<dynamic>>();

    Future<dynamic> getMoviesList() async {
      List<dynamic> moviesList =
          await supabase.from("Movies").select<List<dynamic>>();

      return moviesList;
    }
    //
    // Future<List<Map<String, dynamic>>?> fetchMovieData() async {
    //   final response = await supabase
    //       .from('Movies')
    //       .select('title_rus, genres(name)')
    //       .execute();
    //
    //   return response.data as List<Map<String, dynamic>>;
    // }
    // Future<List<Map<String, dynamic>>?> fetchMovieData() async {
    //   final response = await supabase
    //       .from('Movies')
    //       .select('title_rus, genres(name)')
    //       .execute();
    //
    //   return response.data as List<Map<String, dynamic>>;
    // }
    //
    // Future<List<dynamic>?> getMoviesList() async {
    //   final moviesList = await supabase
    //       .from("Movies")
    //       .select<List<dynamic>>()
    //       .execute();
    //
    //   return moviesList.data as List<dynamic>?;
    // }

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          height: 75.v,
          title: Padding(
            padding: EdgeInsets.only(left: 16.h, right: 16.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "lbl7".tr,
                    style: CustomTextStyles.headlineLargeWhiteExtraBold32,
                  ),
                  TextSpan(
                    text: "lbl_24".tr,
                    style: CustomTextStyles.headlineLargeOrangeExtraBold32,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            // AppbarSubtitle2(
            //   text: "lbl_lilia".tr,
            //   align: TextAlign.end,
            //   margin: EdgeInsets.only(
            //     left: 155.h,
            //     top: 20.v,
            //     bottom: 5.v,
            //   ),
            // ),
          ),
          actions: [
            AppbarSubtitle2(
              text: "Привет,\nUser",
              margin: EdgeInsets.fromLTRB(15.h, 17.v, 1.h, 24.v),
              align: TextAlign.right,
            ),
            AppbarImage(
              imagePath: ImageConstant.imgRectangle11,
              margin: EdgeInsets.fromLTRB(16.h, 5.v, 16.h, 5.v),
            ),
          ],
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
            child: Column(
              children: [
                SizedBox(
                  height: 75.v,
                ),
                Divider(height: 1, thickness: 0.7, color: appTheme.whiteP70),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 16.v,
                    right: 16.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: Text(
                          "lbl11".tr,
                          style: CustomTextStyles.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.v),
                        child: Text(
                          "lbl12".tr,
                          style: CustomTextStyles.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.v),
                        child: Text(
                          "msg16".tr,
                          style: CustomTextStyles.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.v),
                        child: Text(
                          "lbl13".tr,
                          style: CustomTextStyles.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.v),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.h, left: 16.h),
                    child: FutureBuilder(
                        // future: getMoviesData(),
                        // builder: (context, snapshot) {
                        //   if (!snapshot.hasData) {
                        //     return const Center(
                        //         child: CircularProgressIndicator());
                        //   }
                        //   final movie = snapshot.data!;
                        //   return GridView.builder(
                        //       gridDelegate:
                        //       SliverGridDelegateWithMaxCrossAxisExtent(
                        //           maxCrossAxisExtent: 200,
                        //           childAspectRatio: 0.6,
                        //           crossAxisSpacing: 16.h,
                        //           mainAxisSpacing: 16.h),
                        //       itemCount: movie.length,
                        //       itemBuilder: (BuildContext ctx, index) {
                        //         return Container(
                        //           child: Column(
                        //             mainAxisAlignment:
                        //             MainAxisAlignment.spaceEvenly,
                        //             crossAxisAlignment:
                        //             CrossAxisAlignment.start,
                        //             children: [
                        //               ClipRRect(
                        //                 borderRadius:
                        //                 BorderRadius.circular(20.h),
                        //                 child: Image.network(
                        //                     movie[index]["image_movie"],
                        //                     height: 330.v),
                        //               ),
                        //               // Padding(
                        //               //   padding: EdgeInsets.only(top: 0.3.v),
                        //               //   child: Column(
                        //               //       crossAxisAlignment:
                        //               //       CrossAxisAlignment.start,
                        //               //       children: [
                        //               //         Text(
                        //               //           movie[index]["title_rus"],
                        //               //           style: CustomTextStyles
                        //               //               .titleSemiBoldWhite14,
                        //               //           textAlign: TextAlign.start,
                        //               //         )
                        //               //       ]),
                        //               // )
                        //             ],
                        //           ),
                        //         );
                        //       });
                        // }),
                        future: getMoviesList(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          final movie = snapshot.data!;
                          return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 0.6,
                                      crossAxisSpacing: 16.h,
                                      mainAxisSpacing: 16.h),
                              itemCount: movie.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.h),
                                        child: Image.network(
                                            movie[index]["image_movie"],
                                            height: 330.v),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0.3.v),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                movie[index]["title_rus"],
                                                style: CustomTextStyles
                                                    .titleSemiBoldWhite14,
                                                textAlign: TextAlign.start,
                                              ),
                                              //     Text(
                                              //       ${movieData[index]["genres"].join(", ")},
                                              //       style: CustomTextStyles
                                              // .titleSemiBoldWhite14,
                                              //     ),
                                            ]),
                                      )
                                    ],
                                  ),
                                );
                              });
                        }),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomBottomBar(onChanged: (BottomBarEnum type) {
                  Navigator.pushNamed(
                      navigatorKey.currentContext!, getCurrentRoute(type));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
    case BottomBarEnum.Homegray800:
      return "/";
    case BottomBarEnum.Info:
    //return AppRoutes.ticketsActivPage;
    case BottomBarEnum.Profile:
    // return AppRoutes.homepagePage;
    default:
      return "/";
  }
}
