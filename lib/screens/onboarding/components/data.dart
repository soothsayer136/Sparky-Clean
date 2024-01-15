import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../constants/app_image.dart';
import '../onboarding_screen.dart';
import 'body_widget.dart';

const pageDecoration = PageDecoration(
  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
  imageFlex: 2,
  safeArea: 0.3,
  pageColor: Colors.white,
  imagePadding: EdgeInsets.symmetric(vertical: 10),
);

Widget _buildImage(
  String assetName,
) =>
    Image.asset(
      assetName,
    );

_customDotIndicator(bool isDone) => Container(
      width: 12.0,
      height: 12.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDone ? Colors.orange : Colors.grey,
      ),
    );

List<PageViewModel> models = [
  PageViewModel(
    title: "",
    bodyWidget: Column(
      children: [
        _buildImage(o1),
        SizedBox(
          height: 60.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _customDotIndicator(true),
            _customDotIndicator(false),
            _customDotIndicator(false),
          ],
        ),
        SizedBox(
          height: 20.sp,
        ),
        BodyWidget(
            title: "Give Your Home a\n Makeover ",
            subTitle:
                "The best services that you cloud find for your home , as we have everything that you are in need."),
      ],
    ),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "",
    bodyWidget: Column(
      children: [
        _buildImage(o2),
        SizedBox(
          height: 60.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _customDotIndicator(false),
            _customDotIndicator(true),
            _customDotIndicator(false),
          ],
        ),
        SizedBox(
          height: 20.sp,
        ),
        BodyWidget(
            title: "Easy and Fast Services ",
            subTitle:
                "Include all types of service provider from construction to renovation"),
      ],
    ),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "",
    bodyWidget: Column(
      children: [
        _buildImage(o3),
        SizedBox(
          height: 60.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _customDotIndicator(false),
            _customDotIndicator(false),
            _customDotIndicator(true),
          ],
        ),
        SizedBox(
          height: 20.sp,
        ),
        BodyWidget(
          title: "Feel fresh and relax ",
          subTitle:
              "Search from a list of qualified  professionals around you as we bring the best ones for you",
        ),
      ],
    ),
    decoration: pageDecoration,
  ),
];
