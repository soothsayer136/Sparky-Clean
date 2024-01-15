import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/textstyless.dart';

class BodyWidget extends StatelessWidget {
  String title;
  String subTitle;

  BodyWidget({super.key, required this.subTitle, required this.title});

  @override
  Widget build(BuildContext context) {
    // TextStyle? header =
    // const TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600);
    // TextStyle? body = const TextStyle(fontSize: 16.0, color: Color(0xFF30353E));
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title.toString(),
              style: kW5F24G.copyWith(fontSize: 28.sp),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15.sp,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              subTitle.toString(),
              style: kW4F18G.copyWith(),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
