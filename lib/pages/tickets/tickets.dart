import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                  child: AppbarSubtitle(
                      text: "Ваши билеты")),
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
                                    "активные",
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "история",
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.h, right: 16.h),
                              child: TabBarView(
                                  controller: _tabController,
                                  children: <Widget>[Container()])))
                    ])))));
  }
}
