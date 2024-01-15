import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sparkling_clean/constants/colors.dart';
import 'package:sparkling_clean/constants/textstyless.dart';
import 'package:sparkling_clean/screens/login/login_screen.dart';
import 'package:sparkling_clean/screens/onboarding/components/data.dart';

import '../../constants/app_image.dart';
import '../../routes/routes_generator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "/onboarding";
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: models,
      showDoneButton: true,
      back: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 3)),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      showBackButton: true,

      skipOrBackFlex: 0,
      onSkip: () {
        // RouteGenerator.replacePage(NavigationScreen.routeName);
      },
      skip: const Text(
        "skip",
        style: TextStyle(fontSize: 17),
      ),
      nextFlex: 0,
      done: const Text(
        "Continue",
        style: TextStyle(fontSize: 17),
      ),
      onDone: () {
        RouteGenerator.navigateTo(LoginScreen.routeName);
      },
      // showBackButton: false,
      // back: Container(
      //   decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: black.withOpacity(0.8)
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.all(12.0),
      //     child: Icon(Icons.arrow_back,color: white,),
      //   ),
      // ),
      next: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: textOrange),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
      // next: const Text('Next',
      //     style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      isProgress: false,
    );
  }
}
