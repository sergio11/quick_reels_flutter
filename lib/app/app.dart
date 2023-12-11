import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickreels/app/di/app_binding.dart';
import 'package:quickreels/app/routes/app_pages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/app/core/values/app_colors.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';

class App extends StatefulWidget {

  final AppBinding appBindings;

  const App({Key? key, required this.appBindings}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _envConfig.appName,
      initialRoute: AppPages.INITIAL,
      initialBinding: widget.appBindings,
      getPages: AppPages.routes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: _getSupportedLocal(),
      theme: ThemeData(
        primarySwatch: AppColors.colorPrimarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        primaryColor: AppColors.colorPrimary,
        textTheme: const TextTheme(
          button: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  List<Locale> _getSupportedLocal() {
    return [
      const Locale('en', ''),
      const Locale('es', ''),
    ];
  }
}
