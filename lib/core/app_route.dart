
import 'package:get/get_core/src/get_main.dart';

import '../features/presentation/onboarding/onboarding_ui.dart';

class AppRouter {

  static const initialRoute = OnboardingPage.namePath;

  static var generateRoute = (settings) {
    String name = settings.name ?? '';
    Get.log('adkmfkadsm namemme ${name.substring(1)}');
    // if (settings.name == MainPage.namePath) {
    //   return MaterialPageRoute(
    //       builder: (_) => MainPage(guests: Guests.empty()),
    //       fullscreenDialog: true,
    //       maintainState: true);
    // }
    // if (settings.name == AdminView.namePath){
    //   return MaterialPageRoute(
    //       builder: (_) => AdminView(),
    //       fullscreenDialog: true,
    //       maintainState: false);
    // }
    // return MaterialPageRoute(
    //     builder: (_) => OnboardingPage(dearName: name),
    //     fullscreenDialog: true,
    //     maintainState: false,
    //     settings: const RouteSettings(name: AppRouter.initialRoute));
  };

// static final routes = [
//   GetPage(
//     name: OnboardingPage.namePath,
//     page: () => OnboardingPage(dearName: ''),
//     binding: OnboardingBinding(),
//   ),
//   GetPage(
//     name: MainPage.namePath,
//     page: () => MainPage(),
//     transition: Transition.circularReveal,
//     curve: Curves.easeInOutCirc,
//     transitionDuration: const Duration(milliseconds: 300),
//     bindings: [
//       MainBinding(),
//     ],
//   ),
//   // GetPage(
//   //   name: MainPage.namePath,
//   //   page: () => MainPage(),
//   //   transition: Transition.downToUp,
//   //   curve: Curves.easeInOut,
//   //   transitionDuration: const Duration(milliseconds: 500),
//   //   bindings: [
//   //     MainBinding(),
//   //   ],
//   // ),
// ];

// static const router = FluroRouter();
}
