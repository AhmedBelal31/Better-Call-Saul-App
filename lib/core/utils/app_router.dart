import 'package:better_call_saul_app/features/Splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import '../../features/home/presentation/views/character_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';

class AppRouter {
  static const String splashView = '/';
  static const String homeView = 'HomeView';
  static const String characterDetailsView = '/CharactersDetails';

  static Map<String, WidgetBuilder> routes = {
    splashView: (context) => const SplashView(),
    homeView: (context) => const HomeView(),
    characterDetailsView: (context) => const CharacterDetailsView(),
  };
}
