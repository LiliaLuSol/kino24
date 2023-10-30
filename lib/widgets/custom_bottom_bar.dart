// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomeGray800,
      activeIcon: ImageConstant.imgHomeGray800,
      type: BottomBarEnum.Homegray800,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgInfo,
      activeIcon: ImageConstant.imgInfo,
      type: BottomBarEnum.Info,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgProfile,
      activeIcon: ImageConstant.imgProfile,
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Divider(height: 1, thickness: 0.8, color: appTheme.whiteP70),
        ),
        Container(
          height: 89.v,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary.withOpacity(1),
          ),
          // child: BottomNavigationBar(
          //   backgroundColor: Colors.transparent,
          //   showSelectedLabels: false,
          //   showUnselectedLabels: false,
          //   selectedFontSize: 0,
          //   elevation: 0,
          //   currentIndex: selectedIndex,
          //   type: BottomNavigationBarType.fixed,
          //   items: List.generate(bottomMenuList.length, (index) {
          //     return BottomNavigationBarItem(
          //       icon: CustomImageView(
          //         svgPath: bottomMenuList[index].icon,
          //         height: 24.v,
          //         width: 25.h,
          //         color: appTheme.gray4F4F4F,
          //       ),
          //       activeIcon: CustomImageView(
          //         svgPath: bottomMenuList[index].activeIcon,
          //         height: 26.v,
          //         width: 25.h,
          //         color: theme.colorScheme.primary,
          //       ),
          //       label: '',
          //     );
          //   }),
          //   onTap: (index) {
          //     selectedIndex = index;
          //     widget.onChanged?.call(bottomMenuList[index].type);
          //     setState(() {});
          //   },
          // ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: true,
            selectedFontSize: 0,
            elevation: 0,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: List.generate(bottomMenuList.length, (index) {
              String label = '';
              switch (index) {
                case 0:
                  label = 'Главная';
                  break;
                case 1:
                  label = 'Билеты';
                  break;
                case 2:
                  label = 'Профиль';
                  break;
              }
              return BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      CustomImageView(
                        svgPath: bottomMenuList[index].icon,
                        height: 24.v,
                        width: 25.h,
                        color: appTheme.gray4F4F4F,
                      ),
                      Text(label, style: CustomTextStyles.appBarSemiBold)
                    ],
                  ),
                  activeIcon: Column(children: [
                    CustomImageView(
                      svgPath: bottomMenuList[index].activeIcon,
                      height: 26.v,
                      width: 25.h,
                      color: theme.colorScheme.primary,
                    ),
                    Text(label, style: CustomTextStyles.appBarActiveSemiBold)
                  ]),
                  label: '');
            }),
            onTap: (index) {
              selectedIndex = index;
              widget.onChanged?.call(bottomMenuList[index].type);
              setState(() {});
            },
          ),
        )
      ],
    );
  }
}

enum BottomBarEnum {
  Homegray800,
  Info,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

// class DefaultWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(10),
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Please replace the respective Widget here',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
