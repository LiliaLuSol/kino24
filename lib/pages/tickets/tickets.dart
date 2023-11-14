import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/ticket_widget.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> with TickerProviderStateMixin {
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
                          child: ListView.builder(
                            itemBuilder: (_, __) {
                              return Container(
                                height: 200.v,
                                width: 353.h,
                                margin: EdgeInsets.symmetric(vertical: 16.v),
                                child: CustomPaint(
                                  painter: TicketPainter(
                                    borderColor: Colors.black,
                                    bgColor: appTheme.white,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('DEA-HYD',
                                                style: CustomTextStyles
                                                    .bodyLarge),
                                            Text('BH07',
                                                style: CustomTextStyles
                                                    .bodyLarge),
                                            Text('\$140',
                                                style: CustomTextStyles
                                                    .bodyLarge),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('May 30, 2022',
                                                style: CustomTextStyles
                                                    .bodyLarge),
                                            Text("|"),
                                            Text('May 30, 2022',
                                                style: CustomTextStyles
                                                    .bodyLarge),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('10:40AM',
                                                style: CustomTextStyles
                                                    .bodyLarge),
                                            Text("|"),
                                            Text('1h 30m',
                                                style: CustomTextStyles
                                                    .bodyLarge),
                                          ],
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 30.v,
                                              width: 100.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              child:Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 2,
                                                ),
                                                child: SfBarcodeGenerator(value: 'www.syncfusion.com',symbology: Code93()))
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: 6,
                          ),
                        ),
                      ),
                      SizedBox(height: 81.h),
                    ])))));
  }
}
