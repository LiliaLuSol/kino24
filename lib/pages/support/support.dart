import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/widgets/app_bar/appbar_iconbutton.dart';
import 'package:kino24/widgets/app_bar/appbar_subtitle.dart';
import 'package:kino24/widgets/app_bar/custom_app_bar.dart';
import 'package:kino24/widgets/custom_elevated_button.dart';
import 'package:kino24/widgets/custom_text_form_field.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  late TextEditingController messageplaceholController;
  final msgFocusNode = FocusNode();

  @override
  void initState() {
    messageplaceholController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messageplaceholController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

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
                          Navigator.pop(context, true);
                        }),
                    AppbarSubtitle(
                        text: "Обратная связь",
                        margin: EdgeInsets.only(left: 16.h))
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 75.v,
                          ),
                          Divider(
                              height: 1,
                              thickness: 0.8,
                              color: appTheme.whiteP70),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 20.h, right: 20.h, top: 16.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Ваше сообщение",
                                        style: theme.textTheme.bodyMedium),
                                    SizedBox(height: 4.v),
                                    SingleChildScrollView(
                                        child: CustomTextFormField(
                                            controller:
                                                messageplaceholController,
                                            focusNode: msgFocusNode,
                                            maxLines: 30,
                                            autofocus: false,
                                            textStyle:
                                                TextStyle(color: Colors.black),
                                            hintText: "Сообщение...",
                                            textInputAction:
                                                TextInputAction.done)),
                                    SizedBox(height: 16.v),
                                    CustomElevatedButton(
                                      text: "Оправить",
                                      buttonStyle: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            theme.colorScheme.primary,
                                      ),
                                      onTap: () {
                                        context.showsnackbar(
                                            title: 'Сообщение отправлено...',
                                            color: Colors.grey);
                                        GoRouter.of(context)
                                            .push(AppRoutes.homepage);
                                      },
                                      alignment: Alignment.center,
                                    ),
                                  ]))
                        ])))));
  }
}
