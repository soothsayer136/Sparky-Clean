import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/textstyless.dart';

class CenterText extends StatelessWidget {
  TextStyle ? style;
  String ? text;
  CenterText({super.key,this.style,this.text});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text ?? "",style: style,textAlign: TextAlign.center,));

  }
}
