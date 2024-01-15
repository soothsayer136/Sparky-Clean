import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:sparkling_clean/constants/app_image.dart';
import 'package:sparkling_clean/routes/routes_generator.dart';
import 'package:sparkling_clean/screens/complete_profile/complete_profile_screen.dart';
import 'package:sparkling_clean/widgets/custom_buttons.dart';

import '../../constants/colors.dart';
import '../../constants/textstyless.dart';
import '../../widgets/center_text.dart';
import '../../widgets/leading.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});
  static const String routeName = "/verification";

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: textOrange, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: textOrange, width: 2),
      borderRadius: BorderRadius.circular(22),
    ),
  );

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const Leading()),
      body: ListView(
        children: [
          CenterText(
            text: "Verification",
            style: kW5F24G.copyWith(color: textOrange),
          ),
          Image.asset(pngVerification),
          CenterText(
            text: "Enter the 4 digit code sent to your phone number ",
            style: kW5F24G,
          ),
          SizedBox(
            height: 18.sp,
          ),
          Pinput(
            preFilledWidget: const Text(
              "*",
              style: TextStyle(fontSize: 25, color: textOrange),
            ),
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyDecorationWith(
              border: Border.all(color: textOrange, width: 2),
              borderRadius: BorderRadius.circular(22),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration?.copyWith(
              color: Colors.white,
            )),
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) async {
              setState(() {
                loading = true;
              });
              await Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  loading = false;
                });
                RouteGenerator.navigateTo(CompleteProfileScreen.routeName);
              });
            },
          ),
          SizedBox(
            height: 30.sp,
          ),
          loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: textOrange,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.sp),
                  child: CustomButton(
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          loading = false;
                        });

                        RouteGenerator.navigateTo(CompleteProfileScreen.routeName);
                      });
                    },
                    buttonName: "Verify",
                    backgroundColor: textOrange,
                  ),
                ),
        ],
      ),
    );
  }
}
