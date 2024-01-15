import 'package:flutter/material.dart';
import 'package:sparkling_clean/widgets/empty_widget.dart';

import '../../constants/colors.dart';
import '../../constants/textstyless.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "WishList",
          style: kW6F24O.copyWith(color: textOrange),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 40),
        children: [
          EmptyWidget()
        ],
      ),
    );
  }
}
