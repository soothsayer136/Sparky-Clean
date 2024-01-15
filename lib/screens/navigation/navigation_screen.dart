import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sparkling_clean/constants/app_image.dart';
import 'package:sparkling_clean/constants/colors.dart';
import 'package:sparkling_clean/screens/profile/profile_screen.dart';
import 'package:sparkling_clean/screens/service_provider/service_provider.dart';

import '../Booking/booking_screen.dart';
import '../dashboard/dashboard_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({
    Key? key,
  }) : super(key: key);
  static const String routeName = "/navigation";

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  String title = 'Home';
  int _navigationIndex = 0;
  PageController _pagecontroller = PageController();
  setNavigationIndex(int index) {
    setState(() {
      _navigationIndex = index;
    });
  }

  itemTapped(int index) {
    setState(() {
      _navigationIndex = index;
      _pagecontroller.jumpToPage(index);
    });
  }

  _onPageChanged(int index) {
    // onTap
    setNavigationIndex(index);
    setState(() {
      switch (index) {
        case 0:
          {
            title = 'Home';
          }
          break;
        case 1:
          {
            title = 'category';
          }
          break;
        case 2:
          {
            title = 'Favourite';
          }
          break;

        case 3:
          {
            title = 'Saved';
          }
          break;
        case 4:
          {
            title = 'Profile';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_navigationIndex == 0) {
          showBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              backgroundColor: Colors.white,
              builder: (context) {
                return Container(
                  constraints: const BoxConstraints(maxHeight: 600),
                  child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Do you want to quit the application?",
                                style: TextStyle(color: Colors.black)),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              textOrange),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    onPressed: () {
                                      SystemNavigator.pop();
                                    },
                                    child: Text(
                                      "Quit",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                );
              });
        } else {
          itemTapped(0);
        }

        return Future.value(false);
      },
      child: Scaffold(
        body: PageView(
          onPageChanged: _onPageChanged,
          controller: _pagecontroller,
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            const DashBoardScreen(),
            ServiceProvider(),
            BookingScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          height: 80,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: textOrange, borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomMenu(
                      onTap: () => itemTapped(0),
                      color: _navigationIndex == 0
                          ? Colors.grey.shade400
                          : Colors.white,
                      icon: Icons.home,
                    ),
                    CustomMenu(
                      onTap: () => itemTapped(1),
                      color: _navigationIndex == 1
                          ? Colors.grey.shade400
                          : Colors.white,
                      icon: Icons.dashboard,
                    ),
                    CustomMenu(
                      onTap: () => itemTapped(2),
                      color: _navigationIndex == 2
                          ? Colors.grey.shade400
                          : Colors.white,
                      icon: Icons.shopping_cart_rounded,
                    ),
                    CustomMenu(
                      onTap: () => itemTapped(3),
                      color: _navigationIndex == 3
                          ? Colors.grey.shade400
                          : Colors.white,
                      icon: Icons.person,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomMenu extends StatelessWidget {
  void Function()? onTap;
  IconData? icon;
  Color? color;

  CustomMenu({super.key, this.onTap, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: Icon(icon, size: 35, color: color));
  }
}
