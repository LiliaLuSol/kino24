import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/descriptiononfilm/descriptiononfilm.dart';
import 'package:kino24/widgets/app_bar/appbar_image.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    Future<dynamic> getMoviesList() async {
      List<dynamic> moviesList =
          await supabase.from("infomovies").select<List<dynamic>>();

      return moviesList;
    }

    Future<dynamic> getMoviesSoonList() async {
      List<dynamic> moviesList =
          await supabase.from("infomoviessoon").select<List<dynamic>>();

      return moviesList;
    }

    Future<dynamic> getMoviesChildList() async {
      List<dynamic> moviesList =
          await supabase.from("infomovieschild").select<List<dynamic>>();

      return moviesList;
    }

    Future<dynamic> getMoviesPushkinList() async {
      List<dynamic> moviesList =
          await supabase.from("infomoviespushkin").select<List<dynamic>>();

      return moviesList;
    }

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: 75.v,
          title: Padding(
            padding: EdgeInsets.only(left: 16.h, right: 16.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Кино",
                    style: CustomTextStyles.headlineLargeWhiteExtraBold32,
                  ),
                  TextSpan(
                    text: "24",
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
                Divider(height: 1, thickness: 0.8, color: appTheme.whiteP70),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 16.v),
                  child: SizedBox(
                    height: 27.v,
                    width: 359.h,
                    child: TabBar(
                        controller: _tabController,
                        labelPadding: EdgeInsets.zero,
                        labelColor: appTheme.white,
                        labelStyle: TextStyle(
                          fontSize: 16.fSize,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                        ),
                        unselectedLabelColor: appTheme.white,
                        unselectedLabelStyle: TextStyle(
                          fontSize: 16.fSize,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                        ),
                        indicator: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(
                            12.h,
                          ),
                        ),
                        tabs: const [
                          Tab(
                            child: Text(
                              "сегодня",
                            ),
                          ),
                          Tab(
                            child: Text(
                              "скоро",
                            ),
                          ),
                          Tab(
                            child: Text(
                              "детям",
                            ),
                          ),
                          Tab(
                            child: Text(
                              "пушк.карта",
                              maxLines: 2,
                            ),
                          ),
                        ]),
                  ),
                ),
                Divider(height: 1, thickness: 0.8, color: appTheme.whiteP70),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h, right: 16.h),
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        FutureBuilder(
                          future: getMoviesList(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            final movie = snapshot.data!;
                            return buildMoviesGrid(movie);
                          },
                        ),
                        FutureBuilder(
                          future: getMoviesSoonList(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            final movie = snapshot.data!;
                            return buildMoviesGrid(movie);
                          },
                        ),
                        FutureBuilder(
                          future: getMoviesChildList(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            final movie = snapshot.data!;
                            return buildMoviesGrid(movie);
                          },
                        ),
                        FutureBuilder(
                          future: getMoviesPushkinList(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            final movie = snapshot.data!;
                            return buildMoviesGrid(movie);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 81.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildMoviesGrid(List<dynamic> movieList) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 0.54,
      crossAxisSpacing: 16.h,
      mainAxisSpacing: 16.h,
    ),
    itemCount: movieList.length,
    itemBuilder: (BuildContext ctx, index) {
      return InkWell(
        onTap: () {
          Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (context) =>
                  DescriptionOnFilm(movieData: movieList[index]),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movieList[index]["image_movie"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 265.v,
                ),
                Positioned(
                  right: 5.h,
                  top: 5.v,
                  child: Container(
                    width: 39.h,
                    height: 34.v,
                    color: appTheme.blackBackP80,
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: movieList[index]["age_rating"].toString(),
                            style: CustomTextStyles.bodySmallWhiteLight12,
                          ),
                          TextSpan(
                            text: "+",
                            style: CustomTextStyles.bodySmallWhiteLight12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (movieList[index]["pushkin_card"] == true)
                  Positioned(
                    left: 0.h,
                    top: 5.v,
                    child: Container(
                      width: 90.h,
                      height: 34.v,
                      color: appTheme.greenP80,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.h, right: 4.h),
                        child: Text(
                          'Пушкинская карта',
                          style: CustomTextStyles.bodySmallWhiteLight12,
                        ),
                      ),
                    ),
                  ),
                if (movieList[index]["only_internet"] == true)
                  Positioned(
                    left: 0.h,
                    top: 5.v,
                    child: Container(
                      width: 90.h,
                      height: 34.v,
                      color: appTheme.bluelightP80,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.h, right: 4.h),
                        child: Text(
                          'Билеты только онлайн',
                          style: CustomTextStyles.bodySmallWhiteLight12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.3.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieList[index]["title_rus"],
                    style: CustomTextStyles.titleSemiBoldWhite14,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    movieList[index]["genres"],
                    style: CustomTextStyles.bodySmallWhiteLight12,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    movieList[index]["formats"],
                    style: CustomTextStyles.bodySmallWhiteLight12,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}