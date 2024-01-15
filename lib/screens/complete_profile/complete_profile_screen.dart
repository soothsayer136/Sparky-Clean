import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sparkling_clean/constants/app_image.dart';
import 'package:sparkling_clean/routes/routes_generator.dart';
import 'package:sparkling_clean/widgets/leading.dart';

import '../../constants/colors.dart';
import '../../constants/font_weight.dart';
import '../../constants/textstyless.dart';
import '../../widgets/center_text.dart';
import '../../widgets/custom_buttons.dart';
import '../../widgets/custom_text_field.dart';
import '../navigation/navigation_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});
  static const String routeName = "/complete";

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  String ? selectedGender;
  InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: Colors.transparent));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const Leading(),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 35.sp),
        children: [
          Image.asset(pngComplete),
          SizedBox(height: 20.sp,),
          CenterText(
            text: "Complete Your Profile",
            style: kW5F24G,
          ),
          CenterText(
            text: "Don’t worry, only you can see your personal data No one else will be able to see it",
            style: kW5F24G.copyWith(fontSize: 17, fontWeight: kW7),
          ),
          SizedBox(height: 20.sp,),
          CustomTextField(
            controller: name,
            hintText: "Full name",
          ),
          SizedBox(
            height: 30.sp,
          ),
          CustomTextField(
            controller: phone,
            hintText: "Phone number",
          ),
          SizedBox(
            height: 30.sp,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: fieldGrey
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: DropdownButtonFormField(
                value: selectedGender,
                decoration: InputDecoration(
                  enabledBorder: border,
                  focusedBorder: border,
                  disabledBorder: border,
                  hintText: "Gender",
                  hintStyle: kW5F24G.copyWith(fontSize: 18, fontWeight: kW7),
                ),
                items: ['Male', 'Female','Others'].map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          CustomButton(
            backgroundColor: textOrange,
            buttonName: "Complete Profile",
            onPressed: () {
              RouteGenerator.navigateTo(Navigation.routeName);
            },
          ),
        ],
      ),
    );
  }
}
