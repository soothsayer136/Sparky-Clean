import 'package:flutter/material.dart';
import 'package:sparkling_clean/constants/app_image.dart';
import 'package:sparkling_clean/routes/routes_generator.dart';
import 'package:sparkling_clean/screens/login/login_screen.dart';
import 'package:sparkling_clean/widgets/custom_buttons.dart';
import 'package:sparkling_clean/widgets/leading.dart';

import '../../constants/colors.dart';
import '../../constants/textstyless.dart';
import 'components/single_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = "/profile";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Leading(),
        title: Text(
          "Profile",
          style: kW6F24O.copyWith(color: textOrange),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(pngBoy),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
              child: Text(
            "Bikrum Katwal",
            style: TextStyle(
                color: textGrey, fontWeight: FontWeight.w600, fontSize: 16),
          )),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius: -2, // Set spreadRadius to a negative value
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SingleMenu(icon: Icons.person, label: "My Profile"),
                  SingleMenu(icon: Icons.home, label: "Home"),
                  SingleMenu(icon: Icons.favorite, label: "Favourites"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "More",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius: -2, // Set spreadRadius to a negative value
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SingleMenu(icon: Icons.notifications, label: "Notifications"),
                  SingleMenu(icon: Icons.contact_page_sharp, label: "Contact us"),
                  SingleMenu(icon: Icons.add_home_sharp, label: "My booking"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
              buttonName: "Logout",
              backgroundColor: textOrange,
              onPressed: () {
                RouteGenerator.replacePage(LoginScreen.routeName);
              },
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
