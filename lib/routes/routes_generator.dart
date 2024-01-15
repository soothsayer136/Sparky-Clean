import 'package:flutter/material.dart';
import 'package:sparkling_clean/screens/complete_profile/complete_profile_screen.dart';
import 'package:sparkling_clean/screens/login/login_screen.dart';
import 'package:sparkling_clean/screens/onboarding/onboarding_screen.dart';
import 'package:sparkling_clean/screens/payment/payment_screen.dart';
import 'package:sparkling_clean/screens/profile/profile_screen.dart';
import 'package:sparkling_clean/screens/registration/registration_screen.dart';
import 'package:sparkling_clean/screens/service_detail/service_detail.dart';
import 'package:sparkling_clean/screens/service_provider/service_provider.dart';
import 'package:sparkling_clean/screens/splash/splash_screen.dart';
import 'package:sparkling_clean/screens/verification/verification_screen.dart';

import '../screens/navigation/navigation_screen.dart';

class RouteGenerator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> replacePage(String routeName, {Object? args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  static goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    // print("ROUTE:::: ${settings.name}");
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case OnboardingScreen.routeName:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RegistrationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case VerificationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case CompleteProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CompleteProfileScreen());
      case Navigation.routeName:
        return MaterialPageRoute(builder: (_) => const Navigation());
      case ServiceProvider.routeName:
        return MaterialPageRoute(builder: (_) => const ServiceProvider());
      case ServiceDetailScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ServiceDetailScreen());
      case PaymentScreen.routeName:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        _onPageNotFound();
    }
  }

  static Route<dynamic> _onPageNotFound() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: Text("Page not found"),
              ),
            ));
  }
}
