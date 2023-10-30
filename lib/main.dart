import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kino24/other/app_export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await PrefUtils().init();
  await Supabase.initialize(
    url: 'https://wapchyqqghlrtcvsrayd.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndhcGNoeXFxZ2hscnRjdnNyYXlkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTgyMTk5MTQsImV4cCI6MjAxMzc5NTkxNH0.76D6D-Kzc5B5u9_FO-WdW2cXIaJjyEdiXA8jI-b37Bo',
    authFlowType: AuthFlowType.pkce,
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(
        ThemeState(
          themeType: PrefUtils().getThemeData(),
        ),
      ),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: theme.colorScheme.background),
            title: 'kino24',
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorService.navigatorKey,
            home: Scaffold(),
            localizationsDelegates: const [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale(
                'en',
                '',
              ),
            ],
            initialRoute: AppRoutes.onboard,
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
