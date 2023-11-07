import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/profile/profile.dart';
import 'package:kino24/pages/homepage/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kino24/pages/tickets/tickets.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    Homepage(),
    Tickets(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Divider(
                      height: 1, thickness: 0.8, color: appTheme.whiteP70),
                ),
                Container(
                  height: 89.v,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary.withOpacity(1),
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: theme.colorScheme.primary,
                    showUnselectedLabels: true,
                    unselectedItemColor: appTheme.gray4F4F4F,
                    unselectedLabelStyle: CustomTextStyles.appBarSemiBold,
                    selectedLabelStyle: CustomTextStyles.appBarActiveSemiBold,
                    backgroundColor: Colors.transparent,
                    currentIndex: _selectedIndex,
                    onTap: (value) {
                      setState(() {
                        _selectedIndex = value;
                      });
                    },
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: FaIcon(
                          FontAwesomeIcons.house,
                          size: 25.h,
                        ),
                        label: 'главная',
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(
                          FontAwesomeIcons.ticket,
                          size: 25.h,
                        ),
                        label: 'билеты',
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(
                          FontAwesomeIcons.solidUser,
                          size: 25.h,
                        ),
                        label: 'профиль',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
