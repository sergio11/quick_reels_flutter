import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickreels/app/app.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EnvConfig prodConfig = EnvConfig(
    appName: "QuickReels",
    baseUrl: "https://api.github.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  runApp(const App());
}
