import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sparkling_clean/constants/app_image.dart';
import 'package:sparkling_clean/constants/colors.dart';
import 'package:sparkling_clean/constants/font_size.dart';
import 'package:sparkling_clean/constants/font_weight.dart';
import 'package:sparkling_clean/routes/routes_generator.dart';
import 'package:sparkling_clean/screens/login/login_screen.dart';
import 'package:sparkling_clean/screens/onboarding/onboarding_screen.dart';

import '../../constants/textstyless.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "/splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(pngClean,fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.sp, vertical: 20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: kW5F24G,
                          // style: GoogleFonts.poppins(color: Color(0xFF667080),fontSize: 25,fontWeight: FontWeight.w500),
                          children: [
                            const TextSpan(text: "Let’s Find the"),
                            TextSpan(
                                style: kW5F24G.copyWith(color: textOrange),
                                text: " Professional Cleaning & Repair "),
                            const TextSpan(text: "Service"),
                          ])),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "The best home service application where you can find every type of "
                      "skilled worker for particular job related to home",
                  textAlign: TextAlign.center,
                  style: kW4F18G.copyWith(
                      fontSize: 17.sp, color: Colors.grey.shade500),
                ),
                SizedBox(
                  height: 40.sp,
                ),
                Center(
                  child: PhysicalModel(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    elevation: 18,
                    shadowColor: Colors.grey.shade200,
                    child: InkWell(
                      onTap: (){
                        RouteGenerator.replacePage(OnboardingScreen.routeName);
                      },
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.sp, vertical: 10.sp),
                          child: Text(
                            "Let's get Started",
                            style: kW4F18G.copyWith(
                                color: textOrange, fontWeight: kW5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.sp,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(
                          style: kW5F24G.copyWith(
                            fontWeight: kW6,
                            fontSize: sfont_18,
                          ),
                          children: [
                            const TextSpan(text: "Already have an Account? "),
                            TextSpan(
                                text: "Sign in",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    RouteGenerator.replacePage(LoginScreen.routeName);
                                  },
                                style: kW5F24G.copyWith(
                                  color: textOrange,
                                  fontWeight: kW6,
                                  fontSize: sfont_18,
                                  decoration: TextDecoration.underline,
                                )),
                          ])),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
