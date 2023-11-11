import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kino24/main.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/selectseats/selectseats.dart';
import 'package:kino24/widgets/app_bar/appbar_iconbutton.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DescriptionOnFilm extends StatefulWidget {
  final dynamic movieData;

  const DescriptionOnFilm({super.key, required this.movieData});

  @override
  _DescriptionOnFilmState createState() => _DescriptionOnFilmState();
}

class _DescriptionOnFilmState extends State<DescriptionOnFilm> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.movieData["trailer"])!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
        forceHD: true,
        hideControls: false,
        captionLanguage: 'ru',
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    String dateKStr = widget.movieData["release_date_kino"];
    String dateWStr = widget.movieData["release_date_word"];
    DateTime dateTime = DateTime.parse(dateKStr);
    DateTime dateTime1 = DateTime.parse(dateWStr);
    String formattedDateKino = DateFormat('dd.MM.yyyy').format(dateTime);
    String formattedDateWord = DateFormat('dd.MM.yyyy').format(dateTime1);

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
                          GoRouter.of(context).push(AppRoutes.homepage);
                        }),
                    AppbarSubtitle(
                        text: "Подробнее", margin: EdgeInsets.only(left: 16.h))
                  ])),
              styleType: Style.bgFill,
            ),
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                color: theme.colorScheme.background,
                child: Container(
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
                    // color: theme.colorScheme.background,
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
                                  padding: EdgeInsets.only(top: 20.v),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20.v,
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: 257.v,
                                                      width: 172.h,
                                                      child: Stack(children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  widget.movieData[
                                                                      "image_movie"]),
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
                                                            color: appTheme
                                                                .blackBackP80,
                                                            alignment: Alignment
                                                                .center,
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
                                                        ),
                                                      ])),
                                                  Expanded(
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 6.v,
                                                                  left: 16.h,
                                                                  right: 16.h),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  widget.movieData[
                                                                      "title_rus"],
                                                                  style: CustomTextStyles
                                                                      .titleRus,
                                                                  maxLines: 3,
                                                                ),
                                                                Text(
                                                                  widget.movieData[
                                                                      "title_eng"],
                                                                  style: CustomTextStyles
                                                                      .titleMediumWhite,
                                                                  maxLines: 3,
                                                                )
                                                              ])))
                                                ]),
                                            SizedBox(height: 16.v),
                                            Text("Жанр:",
                                                style: CustomTextStyles
                                                    .titleMedium16),
                                            Text(widget.movieData["genres"],
                                                style: CustomTextStyles
                                                    .bodyLargeWhite),
                                            SizedBox(height: 16.v),
                                            Text("Режиссер:",
                                                style: CustomTextStyles
                                                    .titleMedium16),
                                            Text(widget.movieData["producer"],
                                                style: CustomTextStyles
                                                    .bodyLargeWhite),
                                            SizedBox(height: 16.v),
                                            Text("В ролях:",
                                                style: CustomTextStyles
                                                    .titleMedium16),
                                            Text(widget.movieData["roles"],
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyles
                                                    .bodyLargeWhite),
                                            SizedBox(height: 16.v),
                                            Text("Страна:",
                                                style: CustomTextStyles
                                                    .titleMedium16),
                                            Text(widget.movieData["country"],
                                                style: CustomTextStyles
                                                    .bodyLargeWhite),
                                            SizedBox(height: 16.v),
                                            Text("Продолжительность:",
                                                style: CustomTextStyles
                                                    .titleMedium16),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: widget
                                                        .movieData["duration"]
                                                        .toString(),
                                                    style: CustomTextStyles
                                                        .bodyLargeWhite,
                                                  ),
                                                  TextSpan(
                                                    text: " мин.",
                                                    style: CustomTextStyles
                                                        .bodyLargeWhite,
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(height: 16.v),
                                            Text("Премьера в Кино24:",
                                                style: CustomTextStyles
                                                    .titleMedium16),
                                            Text(
                                                formattedDateKino,
                                                style: CustomTextStyles
                                                    .bodyLargeWhite),
                                            SizedBox(height: 16.v),
                                            Text("Мировая премьера:",
                                                style: CustomTextStyles
                                                    .titleMedium16),
                                            Text(
                                                formattedDateWord,
                                                style: CustomTextStyles
                                                    .bodyLargeWhite),
                                            SizedBox(height: 20.v),
                                            Text("Описание фильма",
                                                style:
                                                    CustomTextStyles.titleRus),
                                            SizedBox(height: 16.v),
                                            Text(
                                                widget.movieData["description"],
                                                maxLines: 15,
                                                overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyles
                                                    .bodyLargeWhite),
                                            SizedBox(height: 16.v),
                                            Positioned.fill(
                                                child: YoutubePlayerBuilder(
                                              player: YoutubePlayer(
                                                controller: _controller,
                                                showVideoProgressIndicator:
                                                    true,
                                                progressIndicatorColor:
                                                    theme.colorScheme.primary,
                                                progressColors:
                                                    ProgressBarColors(
                                                  playedColor:
                                                      theme.colorScheme.primary,
                                                  handleColor:
                                                      theme.colorScheme.primary,
                                                ),
                                                onReady: () {
                                                  _controller
                                                      .addListener(() {});
                                                },
                                              ),
                                              builder: (context, player) {
                                                return Container(
                                                  child: player,
                                                );
                                              },
                                            )),
                                            SizedBox(height: 16.v),
                                            CustomElevatedButton(
                                                width: 353.h,
                                                text: "Купить билет",
                                                buttonStyle:
                                                    ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      theme.colorScheme.primary,
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          SelectSeats(
                                                              movieData: widget
                                                                  .movieData,
                                                          ),
                                                    ),
                                                  );
                                                },
                                                alignment: Alignment.center),
                                            SizedBox(height: 16.v),
                                          ]))))
                        ]))))));
  }
}
