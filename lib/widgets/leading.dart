import 'package:flutter/material.dart';

import '../constants/app_image.dart';
import '../routes/routes_generator.dart';

class Leading extends StatelessWidget {
  const Leading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          RouteGenerator.goBack();
        },
        child: Image.asset(
          backArrow,
        ),
      ),
    );
  }
}
