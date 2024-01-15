import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sparkling_clean/constants/app_image.dart';
import 'package:sparkling_clean/constants/colors.dart';
import 'package:sparkling_clean/constants/font_weight.dart';
import 'package:sparkling_clean/constants/textstyless.dart';
import 'package:sparkling_clean/routes/routes_generator.dart';
import 'package:sparkling_clean/screens/verification/verification_screen.dart';
import 'package:sparkling_clean/widgets/center_text.dart';
import 'package:sparkling_clean/widgets/custom_buttons.dart';
import 'package:sparkling_clean/widgets/custom_text_field.dart';
import 'package:sparkling_clean/widgets/leading.dart';

import '../../constants/font_size.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const String routeName = "/register";
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool visibility = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const Leading()),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 35.sp),
        children: [
          CenterText(
            text: "Create Account",
            style: kW5F24G.copyWith(color: textOrange),
          ),
          CenterText(
            text:
                "Fill your information below or register with your social account ",
            style: kW5F24G.copyWith(fontSize: 18, fontWeight: kW7),
          ),
          SizedBox(
            height: 60.sp,
          ),
          CustomTextField(
            hintText: "Username",
            controller: username,
          ),
          SizedBox(
            height: 30.sp,
          ),
          CustomTextField(
            hintText: "E-mail",
            controller: email,
          ),
          SizedBox(
            height: 30.sp,
          ),
          CustomTextField(
            controller: password,
            hintText: "Password",
            obscureText: visibility,
            suffix: IconButton(
              icon: Icon(
                visibility ? Icons.visibility_off : Icons.visibility,
                size: 24,
                color: textGrey,
              ),
              onPressed: () {
                setState(() {
                  visibility = !visibility;
                });
              },
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Center(
            child: RichText(
                text: TextSpan(
                    style: kW5F24G.copyWith(
                      fontWeight: kW6,
                      fontSize: sfont_18,
                    ),
                    children: [
                  const TextSpan(text: "Agree with "),
                  TextSpan(
                      text: "Terms & Conditions",
                      style: kW5F24G.copyWith(
                        color: textOrange,
                        fontWeight: kW6,
                        fontSize: sfont_18,
                      )),
                ])),
          ),
          SizedBox(
            height: 20.sp,
          ),
          CustomButton(
            backgroundColor: textOrange,
            buttonName: "Sign up",
            onPressed: () {
              RouteGenerator.navigateTo(VerificationScreen.routeName);
            },
          ),
          SizedBox(
            height: 30.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.sp),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 2,
                    color: Colors.grey.shade400,
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "OR",
                    style: kW5F24G.copyWith(fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 2,
                    color: Colors.grey.shade400,
                    thickness: 2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.sp),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    pngFacebook,
                    height: 70.sp,
                    color: textOrange.withOpacity(0.5),
                  ),
                ),
                Expanded(
                  child: Image.asset(pngGoogle,
                      height: 70.sp, color: textOrange.withOpacity(0.5)),
                ),
                Expanded(
                  child: Image.asset(pngTwitter,
                      height: 70.sp, color: textOrange.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          Center(
            child: RichText(
                text: TextSpan(
                    style: kW5F24G.copyWith(
                      fontWeight: kW6,
                      fontSize: sfont_18,
                    ),
                    children: [
                  const TextSpan(text: "Already have an account?"),
                  TextSpan(
                      text: " Sign in",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          RouteGenerator.goBack();
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
    );
  }
}
