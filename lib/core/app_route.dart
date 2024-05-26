import 'package:get/get.dart';
import 'package:your_experience/features/presentation/about/about_binding.dart';
import 'package:your_experience/features/presentation/about/about_ui.dart';
import 'package:your_experience/features/presentation/details/portfolio_project/portfolio_project_ui.dart';
import 'package:your_experience/features/presentation/home/home_binding.dart';
import 'package:your_experience/features/presentation/home/home_ui.dart';
import 'package:your_experience/features/presentation/splash/splash_ui.dart';

import '../features/presentation/details/portfolio_project/portfolio_project_binding.dart';

class AppRouter {
  static const initialRoute = SplashUi.namePath;

  static final routes = [
    GetPage(
      name: SplashUi.namePath,
      page: () => SplashUi(),
    ),
    GetPage(
      name: HomeUi.namePath,
      page: () => HomeUi(),
      binding: HomeBinding(),
      transition: Transition.fadeIn
    ),
    GetPage(
      name: PortfolioProjectUi.namePath,
      page: () => PortfolioProjectUi(),
      binding: PortfolioProjectBinding(),
      transition: Transition.cupertinoDialog
    ),
    GetPage(
      name: AboutUi.namePath,
      page: () => AboutUi(),
      binding: AboutBinding(),
    ),
  ];
}
