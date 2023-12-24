import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickreels/app/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quickreels/app/di/app_binding.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp();

  EnvConfig devConfig = EnvConfig(
    appName: "QuickReels Dev",
    baseUrl: "https://github.com/sergio11/quick_reels_flutter",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  final appBindings = AppBinding();
  appBindings.dependencies();

  runApp(App(
    appBindings: appBindings,
  ));

  Future.delayed(const Duration(seconds: 3), () {
    FlutterNativeSplash.remove();
  });
}
