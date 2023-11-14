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
  final dynamic selectedTikets;
  final dynamic selectedId;
  final int hall;
  final int id_show;
  final int totalAmoutTickets;
  final String? selectedDate;
  final String? selectedTime;

  const SelectFood(
      {super.key,
      required this.movieData,
      required this.hall,
      required this.selectedDate,
      required this.selectedTime,
      required this.selectedTikets,
      required this.selectedId,
      required this.id_show,
      required this.totalAmoutTickets});

  @override
  _SelectFoodState createState() => _SelectFoodState();
}

class _SelectFoodState extends State<SelectFood> {
  int totalAmoutFood = 0;

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

  List<int> quantities1 = List.filled(20, 0);
  List<int> quantities2 = List.filled(20, 0);
  List<int> quantities3 = List.filled(20, 0);
  List<int> quantities4 = List.filled(20, 0);
  List<int> quantities5 = List.filled(20, 0);

  List<dynamic> foodListCombo = [];
  List<dynamic> foodListPopcorn = [];
  List<dynamic> foodListDrinks = [];
  List<dynamic> foodListChips = [];
  List<dynamic> foodListSweet = [];

  void updateQuantity1(int index, int value) {
    setState(() {
      quantities1[index] = (quantities1[index] + value).clamp(0, 99);
    });
  }

  void updateQuantity2(int index, int value) {
    setState(() {
      quantities2[index] = (quantities2[index] + value).clamp(0, 99);
    });
  }

  void updateQuantity3(int index, int value) {
    setState(() {
      quantities3[index] = (quantities3[index] + value).clamp(0, 99);
    });
  }

  void updateQuantity4(int index, int value) {
    setState(() {
      quantities4[index] = (quantities4[index] + value).clamp(0, 99);
    });
  }

  void updateQuantity5(int index, int value) {
    setState(() {
      quantities5[index] = (quantities5[index] + value).clamp(0, 99);
    });
  }

  List<String> name_food1 = [];

  void clearSelections() {
    setState(() {
      name_food1.clear();
    });
  }

  void calculateTotalCost(
      List<dynamic> foodListCombo,
      List<dynamic> foodListPopcorn,
      List<dynamic> foodListDrinks,
      List<dynamic> foodListChips,
      List<dynamic> foodListSweet) {
    clearSelections();
    totalAmoutFood = 0;
    const maxLength = 70;
    for (int i = 0; i < foodListCombo.length; i++) {
      if (quantities1[i] > 0) {
        double totalCost = 0;
        totalCost += (foodListCombo[i]["cost"] * quantities1[i]);
        name_food1.add(foodListCombo[i]["name"] +
            "  " +
            " х" +
            quantities1[i].toString() +
            "  " +
            totalCost.toInt().toString() +
            " руб.");
        totalAmoutFood += totalCost.toInt();
      }
    }
    for (int i = 0; i < foodListPopcorn.length; i++) {
      if (quantities2[i] > 0) {
        double totalCost = 0;
        totalCost += (foodListPopcorn[i]["cost"] * quantities2[i]);
        name_food1.add(foodListPopcorn[i]["name"] +
            "   " +
            " х" +
            quantities2[i].toString() +
            "   " +
            totalCost.toInt().toString() +
            " руб.");
        totalAmoutFood += totalCost.toInt();
      }
    }
    for (int i = 0; i < foodListDrinks.length; i++) {
      if (quantities3[i] > 0) {
        double totalCost = 0;
        totalCost += (foodListDrinks[i]["cost"] * quantities3[i]);
        name_food1.add(foodListDrinks[i]["name"] +
            "   " +
            " х" +
            quantities3[i].toString() +
            "   " +
            totalCost.toInt().toString() +
            " руб.");
        totalAmoutFood += totalCost.toInt();
      }
    }
    for (int i = 0; i < foodListChips.length; i++) {
      if (quantities4[i] > 0) {
        double totalCost = 0;
        totalCost += (foodListChips[i]["cost"] * quantities4[i]);
        name_food1.add(foodListChips[i]["name"] +
            "   " +
            " х" +
            quantities4[i].toString() +
            "   " +
            totalCost.toInt().toString() +
            " руб.");
        totalAmoutFood += totalCost.toInt();
      }
    }
    for (int i = 0; i < foodListSweet.length; i++) {
      if (quantities5[i] > 0) {
        double totalCost = 0;
        totalCost += (foodListSweet[i]["cost"] * quantities5[i]);
        name_food1.add(foodListSweet[i]["name"] +
            "   " +
            " х" +
            quantities5[i].toString() +
            "   " +
            totalCost.toInt().toString() +
            " руб.");
        totalAmoutFood += totalCost.toInt();
      }
    }
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
                                            FutureBuilder(
                                              future: getComboList(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                final food = snapshot.data!;
                                                return buildFoodGrid1(food);
                                              },
                                            ),
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
                                                return buildFoodGrid2(food);
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
                                                return buildFoodGrid3(food);
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
                                                return buildFoodGrid4(food);
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
                                                return buildFoodGrid5(food);
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
                                                          movieData:
                                                              widget.movieData,
                                                          hall: widget.hall,
                                                          selectedDate: widget
                                                              .selectedDate,
                                                          selectedTime: widget
                                                              .selectedTime,
                                                          totalAmoutTickets: widget
                                                              .totalAmoutTickets,
                                                          selectedTikets: widget
                                                              .selectedTikets,
                                                          totalAmoutFood:
                                                              totalAmoutFood,
                                                          selectedfood:
                                                              name_food1,
                                                          selectedId: widget
                                                              .selectedId,
                                                      id_show: widget.id_show),
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

  Widget buildFoodGrid1(List<dynamic> foodList) {
    foodListCombo = foodList;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.54,
          crossAxisSpacing: 16.h,
          mainAxisSpacing: 16.h,
          mainAxisExtent: 432.v),
      shrinkWrap: true,
      itemCount: foodList.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
            width: 353.h,
            padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 8.v),
            decoration: AppDecoration.fillOnPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
            alignment: Alignment.topCenter,
            child: Column(children: [
              SizedBox(height: 16.v),
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
              Text(
                foodList[index]["name"],
                style: CustomTextStyles.bodyLargeWhite18,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 7.v),
              SizedBox(
                  width: 309.h,
                  child: Text(foodList[index]["description"],
                      maxLines: 7,
                      //  overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallWhiteLight)),
              Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: foodList[index]["cost"].toString(),
                    style: CustomTextStyles.bodyLargeWhite18),
                TextSpan(
                    text: " руб.", style: CustomTextStyles.bodyLargeWhite18),
              ])),
              SizedBox(height: 8.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomIconButton(
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    padding: EdgeInsets.all(5.h),
                    decoration: IconButtonStyleHelper.outlineWhite,
                    child: CustomImageView(
                        svgPath: ImageConstant.imgIcbaselineminus,
                        color: Colors.white),
                    onTap: () {
                      updateQuantity1(index, -1);
                      calculateTotalCost(foodListCombo, foodListPopcorn,
                          foodListDrinks, foodListChips, foodListSweet);
                    }),
                Padding(
                    padding: EdgeInsets.only(left: 21.h, top: 5.v, bottom: 5.v),
                    child: Text(quantities1[index].toString(),
                        style: CustomTextStyles.bodyLargeWhite18)),
                CustomIconButton(
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    margin: EdgeInsets.only(left: 21.h),
                    padding: EdgeInsets.all(5.h),
                    child: CustomImageView(
                        svgPath: ImageConstant.imgIcbaselineplus),
                    onTap: () {
                      updateQuantity1(index, 1);
                      calculateTotalCost(foodListCombo, foodListPopcorn,
                          foodListDrinks, foodListChips, foodListSweet);
                    }),
              ]),
              SizedBox(height: 16.v),
            ]));
      },
    );
  }

  Widget buildFoodGrid2(List<dynamic> foodList) {
    foodListPopcorn = foodList;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.54,
          crossAxisSpacing: 16.h,
          mainAxisSpacing: 16.h,
          mainAxisExtent: 432.v),
      shrinkWrap: true,
      itemCount: foodList.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
            width: 353.h,
            padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 8.v),
            decoration: AppDecoration.fillOnPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
            alignment: Alignment.topCenter,
            child: Column(children: [
              SizedBox(height: 16.v),
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
              Text(
                foodList[index]["name"],
                style: CustomTextStyles.bodyLargeWhite18,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 7.v),
              SizedBox(
                  width: 309.h,
                  child: Text(foodList[index]["description"],
                      maxLines: 7,
                      //  overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallWhiteLight)),
              Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: foodList[index]["cost"].toString(),
                    style: CustomTextStyles.bodyLargeWhite18),
                TextSpan(
                    text: " руб.", style: CustomTextStyles.bodyLargeWhite18),
              ])),
              SizedBox(height: 8.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomIconButton(
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    padding: EdgeInsets.all(5.h),
                    decoration: IconButtonStyleHelper.outlineWhite,
                    child: CustomImageView(
                        svgPath: ImageConstant.imgIcbaselineminus,
                        color: Colors.white),
                    onTap: () {
                      updateQuantity2(index, -1);
                      calculateTotalCost(foodListCombo, foodListPopcorn,
                          foodListDrinks, foodListChips, foodListSweet);
                    }),
                Padding(
                    padding: EdgeInsets.only(left: 21.h, top: 5.v, bottom: 5.v),
                    child: Text(quantities2[index].toString(),
                        style: CustomTextStyles.bodyLargeWhite18)),
                CustomIconButton(
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    margin: EdgeInsets.only(left: 21.h),
                    padding: EdgeInsets.all(5.h),
                    child: CustomImageView(
                        svgPath: ImageConstant.imgIcbaselineplus),
                    onTap: () {
                      updateQuantity2(index, 1);
                      calculateTotalCost(foodListCombo, foodListPopcorn,
                          foodListDrinks, foodListChips, foodListSweet);
                    }),
              ]),
              SizedBox(height: 16.v),
            ]));
      },
    );
  }

  Widget buildFoodGrid3(List<dynamic> foodList) {
    foodListDrinks = foodList;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.54,
          crossAxisSpacing: 16.h,
          mainAxisSpacing: 16.h,
          mainAxisExtent: 432.v),
      shrinkWrap: true,
      itemCount: foodList.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
            width: 353.h,
            padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 8.v),
            decoration: AppDecoration.fillOnPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
            alignment: Alignment.topCenter,
            child: Column(children: [
              SizedBox(height: 16.v),
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
              Text(
                foodList[index]["name"],
                style: CustomTextStyles.bodyLargeWhite18,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 7.v),
              SizedBox(
                  width: 309.h,
                  child: Text(foodList[index]["description"],
                      maxLines: 7,
                      //  overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallWhiteLight)),
              Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: foodList[index]["cost"].toString(),
                    style: CustomTextStyles.bodyLargeWhite18),
                TextSpan(
                    text: " руб.", style: CustomTextStyles.bodyLargeWhite18),
              ])),
              SizedBox(height: 8.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomIconButton(
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    padding: EdgeInsets.all(5.h),
                    decoration: IconButtonStyleHelper.outlineWhite,
                    child: CustomImageView(
                        svgPath: ImageConstant.imgIcbaselineminus,
                        color: Colors.white),
                    onTap: () {
                      updateQuantity3(index, -1);
                      calculateTotalCost(foodListCombo, foodListPopcorn,
                          foodListDrinks, foodListChips, foodListSweet);
                    }),
                Padding(
                    padding: EdgeInsets.only(left: 21.h, top: 5.v, bottom: 5.v),
                    child: Text(quantities3[index].toString(),
                        style: CustomTextStyles.bodyLargeWhite18)),
                CustomIconButton(
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    margin: EdgeInsets.only(left: 21.h),
                    padding: EdgeInsets.all(5.h),
                    child: CustomImageView(
                        svgPath: ImageConstant.imgIcbaselineplus),
                    onTap: () {
                      updateQuantity3(index, 1);
                      calculateTotalCost(foodListCombo, foodListPopcorn,
                          foodListDrinks, foodListChips, foodListSweet);
                    }),
              ]),
              SizedBox(height: 16.v),
            ]));
      },
    );
  }

  Widget buildFoodGrid4(List<dynamic> foodList) {
    foodListChips = foodList;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.54,
          crossAxisSpacing: 16.h,
          mainAxisSpacing: 16.h,
          mainAxisExtent: 432.v),
      shrinkWrap: true,
      itemCount: foodList.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
            width: 353.h,
            padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 8.v),
            decoration: AppDecoration.fillOnPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
            alignment: Alignment.topCenter,
            child: Column(children: [
              SizedBox(height: 16.v),
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
              Text(
                foodList[index]["name"],
                style: CustomTextStyles.bodyLargeWhite18,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 7.v),
              SizedBox(
                  width: 309.h,
                  child: Text(foodList[index]["description"],
                      maxLines: 7,
                      //  overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallWhiteLight)),
              Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: foodList[index]["cost"].toString(),
                    style: CustomTextStyles.bodyLargeWhite18),
                TextSpan(
                    text: " руб.", style: CustomTextStyles.bodyLargeWhite18),
              ])),
              SizedBox(height: 8.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomIconButton(
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    padding: EdgeInsets.all(5.h),
                    decoration: IconButtonStyleHelper.outlineWhite,
                    child: CustomImageView(
                        svgPath: ImageConstant.imgIcbaselineminus,
                        color: Colors.white),
                    onTap: () {
                      updateQuantity4(index, -1);
                      calculateTotalCost(foodListCombo, foodListPopcorn,
                          foodListDrinks, foodListChips, foodListSweet);
                    }),
                Padding(
                    padding: EdgeInsets.only(left: 21.h, top: 5.v, bottom: 5.v),
                    child: Text(quantities4[index].toString(),
                        style: CustomTextStyles.bodyLargeWhite18)),
                CustomIconButton(
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    margin: EdgeInsets.only(left: 21.h),
                    padding: EdgeInsets.all(5.h),
                    child: CustomImageView(
                        svgPath: ImageConstant.imgIcbaselineplus),
                    onTap: () {
                      updateQuantity4(index, 1);
                      calculateTotalCost(foodListCombo, foodListPopcorn,
                          foodListDrinks, foodListChips, foodListSweet);
                    }),
              ]),
              SizedBox(height: 16.v),
            ]));
      },
    );
  }

  Widget buildFoodGrid5(List<dynamic> foodList) {
    foodListSweet = foodList;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.54,
          crossAxisSpacing: 16.h,
          mainAxisSpacing: 16.h,
          mainAxisExtent: 432.v),
      shrinkWrap: true,
      itemCount: foodList.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
            width: 353.h,
            padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 8.v),
            decoration: AppDecoration.fillOnPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
            alignment: Alignment.topCenter,
            child: Column(children: [
              SizedBox(height: 16.v),
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
              Text(
                foodList[index]["name"],
                style: CustomTextStyles.bodyLargeWhite18,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 7.v),
              SizedBox(
                  width: 309.h,
                  child: Text(foodList[index]["description"],
                      maxLines: 7,
                      //  overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallWhiteLight)),
              Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: foodList[index]["cost"].toString(),
                    style: CustomTextStyles.bodyLargeWhite18),
                TextSpan(
                    text: " руб.", style: CustomTextStyles.bodyLargeWhite18),
              ])),
              SizedBox(height: 8.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomIconButton(
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    padding: EdgeInsets.all(5.h),
                    decoration: IconButtonStyleHelper.outlineWhite,
                    child: CustomImageView(
                        svgPath: ImageConstant.imgIcbaselineminus,
                        color: Colors.white),
                    onTap: () {
                      updateQuantity5(
                        index,
                        -1,
                      );
                      calculateTotalCost(foodListCombo, foodListPopcorn,
                          foodListDrinks, foodListChips, foodListSweet);
                    }),
                Padding(
                    padding: EdgeInsets.only(left: 21.h, top: 5.v, bottom: 5.v),
                    child: Text(quantities5[index].toString(),
                        style: CustomTextStyles.bodyLargeWhite18)),
                CustomIconButton(
                    height: 33.adaptSize,
                    width: 33.adaptSize,
                    margin: EdgeInsets.only(left: 21.h),
                    padding: EdgeInsets.all(5.h),
                    child: CustomImageView(
                        svgPath: ImageConstant.imgIcbaselineplus),
                    onTap: () {
                      updateQuantity5(index, 1);
                      calculateTotalCost(foodListCombo, foodListPopcorn,
                          foodListDrinks, foodListChips, foodListSweet);
                    }),
              ]),
              SizedBox(height: 16.v),
            ]));
      },
    );
  }
}
