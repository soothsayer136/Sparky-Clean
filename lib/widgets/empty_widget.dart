import 'package:flutter/material.dart';
import 'package:sparkling_clean/constants/app_image.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(noImage);
  }
}
