import 'package:flutter/material.dart';
import 'package:uniqcast_code_challenge/core/constants/app_constants.dart';
import 'package:uniqcast_code_challenge/core/managers/router_manager/router_config.dart';
import 'package:uniqcast_code_challenge/core/managers/theme_manager/app_theme.dart';

class App extends StatelessWidget {
  const App._();

  static App instance() => const App._();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.darkTheme,
      routerConfig: routerConfig,
    );
  }
}
