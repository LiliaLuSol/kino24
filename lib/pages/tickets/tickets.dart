import 'package:flutter/material.dart';
import 'package:kino24/main.dart';
import 'package:kino24/other/app_export.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> with TickerProviderStateMixin {
  Future<dynamic> getInfoTicket() async {
    List<dynamic> ticketList = await supabase
        .from("users_tickets")
        .select<List<dynamic>>()
        .eq("user", getEmail().toString());

    return ticketList;
  }

  String? getEmail() {
    final currentUser = supabase.auth.currentUser;
    if (currentUser != null) {
      final email = currentUser.email!;
      return email;
    } else {
      return "Ваш email скоро здесь появится...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
              height: 75.v,
              leadingWidth: double.maxFinite,
              title: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: AppbarSubtitle(text: "Ваши билеты")),
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
                      appTheme.blackBack.withOpacity(0.2),
                    ],
                  ),
                ),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(
                        height: 75.v,
                      ),
                      Divider(
                          height: 1, thickness: 0.8, color: appTheme.whiteP70),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          child: FutureBuilder(
                            future: getInfoTicket(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              final movie = snapshot.data!;
                              return buildMoviesGrid(movie);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 81.h),
                    ])))));
  }

  Widget buildMoviesGrid(List<dynamic> ticketList) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 353.h,
          childAspectRatio: 0.54,
          crossAxisSpacing: 16.h,
          mainAxisSpacing: 16.h,
          mainAxisExtent: 200.v),
      itemCount: ticketList.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
            height: 200.v,
            width: 353.h,
            margin: EdgeInsets.symmetric(vertical: 16.v),
            child: CustomPaint(
              painter: TicketPainter(
                borderColor: appTheme.black,
                bgColor: appTheme.white,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.v, horizontal: 64.h),
                child: Column(children: [
                  Text(ticketList[index]["movie"],
                      style: CustomTextStyles.BoldBlack14),
                  SizedBox(height: 24.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ticketList[index]["time"] + (" " * 9),
                          style: CustomTextStyles.RegularBlack12),
                      Text('|', style: CustomTextStyles.RegularBlack12),
                      Text(ticketList[index]["date"],
                          style: CustomTextStyles.RegularBlack12),
                    ],
                  ),
                  SizedBox(height: 4.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Зал ",
                            style: CustomTextStyles.RegularBlack12),
                        TextSpan(
                            text: ticketList[index]["hall"],
                            style: CustomTextStyles.RegularBlack12)
                      ])),
                      Text("|", style: CustomTextStyles.RegularBlack12),
                      Text(ticketList[index]["seat"],
                          style: CustomTextStyles.RegularBlack12),
                    ],
                  ),
                  SizedBox(height: 26.v),
                  SizedBox(
                      height: 30.v,
                      child: SfBarcodeGenerator(
                          value: ticketList[index]["id"].toString(),
                          symbology: Code93(),
                          barColor: appTheme.black)),
                ]),
              ),
            ));
      },
    );
  }
}
