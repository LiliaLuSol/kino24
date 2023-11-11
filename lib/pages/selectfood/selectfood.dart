import 'package:flutter/material.dart';
import 'package:kino24/main.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/result/result.dart';
import 'package:kino24/widgets/app_bar/appbar_iconbutton.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';
import 'package:kino24/widgets/custom_icon_button.dart';

class SelectFood extends StatefulWidget {
  final dynamic movieData;

  const SelectFood({super.key, required this.movieData});

  @override
  _SelectFoodState createState() => _SelectFoodState();
}

class _SelectFoodState extends State<SelectFood> {
  Future<dynamic> getComboList() async {
    List<dynamic> foodList =
        await supabase.from("food").select<List<dynamic>>().eq("type", "Combo");

    return foodList;
  }

  Future<dynamic> getPopcornList() async {
    List<dynamic> foodList = await supabase
        .from("food")
        .select<List<dynamic>>()
        .eq("type", "Popcorn");

    return foodList;
  }

  Future<dynamic> getDrinksList() async {
    List<dynamic> foodList = await supabase
        .from("food")
        .select<List<dynamic>>()
        .eq("type", "Drinks");

    return foodList;
  }

  Future<dynamic> getSweetsList() async {
    List<dynamic> foodList = await supabase
        .from("food")
        .select<List<dynamic>>()
        .eq("type", "Sweets");

    return foodList;
  }

  Future<dynamic> getChipsList() async {
    List<dynamic> foodList =
        await supabase.from("food").select<List<dynamic>>().eq("type", "Chips");

    return foodList;
  }

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
                          Navigator.pop(context, true);
                        }),
                    AppbarSubtitle(
                        text: "Онлайн бар", margin: EdgeInsets.only(left: 16.h))
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
                                    SizedBox(height: 16.v),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h),
                                      child: Text(
                                          "Выберите и оплатите напитки и еду в приложении. В баре просто сообщи номер заказа или покажи qr-код.",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              CustomTextStyles.bodyLargeWhite),
                                    ),
                                    SizedBox(height: 16.v),
                                    Divider(
                                        height: 1,
                                        thickness: 0.8,
                                        color: appTheme.whiteP70),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 16.v),
                                            Text("Комбо-наборы",
                                                style:
                                                    CustomTextStyles.titleRus),
                                            // SingleChildScrollView(
                                            //   scrollDirection: Axis.vertical,
                                            //   child:
                                            FutureBuilder(
                                              future: getComboList(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                final food = snapshot.data!;
                                                return buildFoodGrid(food);
                                              },
                                            ),
                                            // ),
                                            SizedBox(height: 16.v),
                                            Text("Попкорн",
                                                style:
                                                    CustomTextStyles.titleRus),
                                            FutureBuilder(
                                              future: getPopcornList(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                final food = snapshot.data!;
                                                return buildFoodGrid(food);
                                              },
                                            ),
                                            SizedBox(height: 16.v),
                                            Text("Напитки",
                                                style:
                                                    CustomTextStyles.titleRus),
                                            FutureBuilder(
                                              future: getDrinksList(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                final food = snapshot.data!;
                                                return buildFoodGrid(food);
                                              },
                                            ),
                                            SizedBox(height: 16.v),
                                            Text("Чипсы",
                                                style:
                                                    CustomTextStyles.titleRus),
                                            FutureBuilder(
                                              future: getChipsList(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                final food = snapshot.data!;
                                                return buildFoodGrid(food);
                                              },
                                            ),
                                            SizedBox(height: 16.v),
                                            Text("Сладости",
                                                style:
                                                    CustomTextStyles.titleRus),
                                            FutureBuilder(
                                              future: getSweetsList(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                final food = snapshot.data!;
                                                return buildFoodGrid(food);
                                              },
                                            ),
                                            SizedBox(height: 16.v),
                                            CustomElevatedButton(
                                                width: 353.h,
                                                text: "Продолжить",
                                                buttonStyle:
                                                    ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      theme.colorScheme.primary,
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => Result(
                                                          movieData: widget.movieData),
                                                    ),
                                                  );
                                                },
                                                alignment: Alignment.center),
                                            SizedBox(height: 16.v),
                                          ],
                                        )),
                                  ])))
                    ])))));
  }
}

Widget buildFoodGrid(List<dynamic> foodList) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 0.54,
      crossAxisSpacing: 16.h,
      mainAxisSpacing: 16.h,
    ),
    shrinkWrap: true,
    itemCount: foodList.length,
    itemBuilder: (BuildContext ctx, index) {
      return Container(
        width: 353.h,
          padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 8.v),
          decoration: AppDecoration.fillOnPrimary
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
          alignment: Alignment.topCenter,
          child: Column(
              children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(foodList[index]["image"]),
                  fit: BoxFit.cover,
                ),
              ),
              height: 130.v,
              width: 120.v,
            ),
            SizedBox(height: 9.v),
            Text(foodList[index]["name"],
                style: CustomTextStyles.bodyLargeWhite18,maxLines: 2,textAlign: TextAlign.center,),
            SizedBox(height: 7.v),
            SizedBox(
                width: 309.h,
                child: Text(foodList[index]["description"],
                    maxLines: 7,
                  //  overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodySmallWhiteLight)),
            SizedBox(height: 8.v),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: foodList[index]["cost"].toString(),
                  style: CustomTextStyles.bodyLargeWhite18),
              TextSpan(text: " руб.", style: CustomTextStyles.bodyLargeWhite18),
            ])),
            SizedBox(height: 8.v),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomIconButton(
                  height: 33.adaptSize,
                  width: 33.adaptSize,
                  padding: EdgeInsets.all(5.h),
                  decoration: IconButtonStyleHelper.outlineGray,
                  child: CustomImageView(
                      svgPath: ImageConstant.imgIcbaselineminus)),
              Padding(
                  padding: EdgeInsets.only(left: 21.h, top: 5.v, bottom: 5.v),
                  child: Text("0", style: CustomTextStyles.bodyLargeWhite18)),
              CustomIconButton(
                  height: 33.adaptSize,
                  width: 33.adaptSize,
                  margin: EdgeInsets.only(left: 21.h),
                  padding: EdgeInsets.all(5.h),
                  child:
                      CustomImageView(svgPath: ImageConstant.imgIcbaselineplus))
            ])
          ]));
    },
  );
}
