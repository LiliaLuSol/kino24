import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';
import 'bloc/onboard_bloc.dart';
import 'models/onboard_model.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class Onboard extends StatelessWidget {
  Onboard({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardBloc>(
      create: (context) => OnboardBloc(OnboardState(
        onboardModelObj: OnboardModel(),
      ))
        ..add(OnboardInitialEvent()),
      child: Onboard(),
    );
  }

  final PageController pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  final List<Widget> pages = [
    OnboardPage(title1: "msg1".tr,title2:"lbl_24".tr,message:"msg2".tr),
    OnboardPage(title1: "msg3".tr,title2:"msg4".tr,message:"msg5".tr),
    OnboardPage(title1: "msg6".tr,title2:"msg7".tr,message:"msg8".tr),
  ];

  int currentPageIndex = 0;
  final String namebuttonC = "Продолжить";
  final String namebuttonF = "Завершить";

  ValueNotifier<String> buttonTextNotifier =
      ValueNotifier<String>("Продолжить");

  String getLabel(int page) {
    if (page == 2) {
      buttonTextNotifier.value = namebuttonF;
    } else {
      buttonTextNotifier.value = namebuttonC;
    }
    return buttonTextNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<OnboardBloc, OnboardState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    appTheme.orangeP20.withOpacity(0.2),
                    appTheme.blackBack.withOpacity(0.2),
                  ],
                ),
              ),
              child: Container(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: pages.length,
                        itemBuilder: (context, index) {
                          return pages[index];
                        },
                        onPageChanged: (int page) {
                          _currentPageNotifier.value = page;
                          currentPageIndex = page;
                          getLabel(page);
                        },
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      bottom: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CirclePageIndicator(
                          itemCount: pages.length,
                          currentPageNotifier: _currentPageNotifier,
                        ),
                      ),
                    ),
                    //SizedBox(height: 56.v),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.h,
                        ),
                        child: ValueListenableBuilder<String>(
                            valueListenable: buttonTextNotifier,
                            builder: (context, label, child) {
                              return CustomElevatedButton(
                                  text: label,
                                  margin: EdgeInsets.fromLTRB(
                                      5.h, 131.v, 3.h, 131.v),
                                  buttonStyle: ElevatedButton.styleFrom(
                                    backgroundColor: theme.colorScheme.primary,
                                  ),
                                  onTap: () {
                                    if (getLabel(currentPageIndex) ==
                                        namebuttonC) {
                                      if (currentPageIndex < pages.length - 1) {
                                        pageController.animateToPage(
                                            currentPageIndex + 1,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease);
                                      }
                                    } else {
                                      NavigatorService.pushNamed(
                                        AppRoutes.authReg,
                                      );
                                    }
                                  });
                            })),
                    // Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String title1;
  final String title2;
  final String message;

  OnboardPage({required this.title1,required this.title2, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 336.h,
          margin: EdgeInsets.only(
            left: 12.h,
            right: 11.h,
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title1,
                  style: CustomTextStyles.headlineLargeWhiteSemiBold32,
                ),
                TextSpan(
                  text: title2,
                  style: CustomTextStyles.headlineLargeOrangeSemiBold32,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 353.h,
          margin: EdgeInsets.only(
            left: 5.h,
            top: 82.v,
            right: 3.h,
          ),
          child: Text(
            message,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}