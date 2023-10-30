import 'package:flutter/material.dart';
import 'package:kino24/pages/authorization/authorization.dart';
import 'package:kino24/pages/homepage/homepag.dart';
import 'package:kino24/pages/screensaver/screensaver.dart';
import 'package:kino24/pages/auth_reg/auth_reg.dart';
import 'package:kino24/pages/registration/registration.dart';
import 'package:kino24/pages/profile_user/profile_user.dart';
import 'package:kino24/pages/onboard/onboard.dart';

class AppRoutes {
  static const String screensaver = '/screensaver';

  static const String authReg= '/auth_reg';

  static const String authorization = '/authorization';

  static const String registration= '/registration';

  static const String homepage = '/homepage';

  static const String profileUser = '/profile_user';

  static const String onboard = '/onboard';

  static Map<String, WidgetBuilder> get routes => {
    screensaver: Screensaver.builder,
    authReg: AuthReg.builder,
    authorization: Authorization.builder,
    registration: Registration.builder,
    homepage: Homepage.builder,
    profileUser: ProfileUser.builder,
    onboard: Onboard.builder,
  };
}
