import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sparkling_clean/constants/datas.dart';

import '../../constants/app_image.dart';
import '../../constants/colors.dart';
import '../../constants/textstyless.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  String selectedValue = 'Cleaning'; // Default selected value
  List<String> _selected = ["Cleaning"];
  List<String> fav = ["1"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
                flex: 3,
                child: Image.asset(
                  pngDrawer,
                  height: 30,
                )),
            Expanded(
                flex: 4,
                child: Text("Cleany", style: kW6F24O.copyWith(fontSize: 26))),
            const Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.storefront,
                        size: 30,
                        color: textOrange,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                        color: textOrange,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 250.sp,
            width: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 40.sp, right: 40.sp, bottom: 40.sp, top: 32.sp),
                  child: Container(
                    height: 250.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: textOrange,
                        borderRadius: BorderRadius.circular(15.sp)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.sp,
                          ),
                          Text(
                            "Home Cleaning",
                            style: kW5F24G.copyWith(
                                color: Colors.white, fontSize: 26),
                          ),
                          Text("  up to",
                              style: kW5F24G.copyWith(color: Colors.white60)),
                          Text("      50%",
                              style: kW5F24G.copyWith(
                                  color: Colors.white, fontSize: 26)),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: -20.sp,
                    bottom: 30.sp,
                    height: 220.sp,
                    width: 220.sp,
                    child: Image.asset('assets/images/girl.png'))
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: CupertinoTextField(
                placeholder: "Search",
                placeholderStyle: const TextStyle(
                    fontWeight: FontWeight.w200, color: Color(0xFF667080)),
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: fieldGrey, borderRadius: BorderRadius.circular(15)),
                suffix: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Image.asset(
                    pngSearch,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: fieldGrey,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(8),
                      underline: Container(),
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Cleaning',
                        'Paining',
                        'Electrician',
                        'Repairing'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            width: 100, // Set the width of each item
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Image.asset(
                  pngFilter,
                  height: 50,
                  width: 50,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                      categories.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selected.clear();
                                  _selected.add(categories[index]['name']);
                                });
                              },
                              child: Container(
                                height: 80.sp,
                                width: 100.sp,
                                decoration: BoxDecoration(
                                    color: fieldGrey,
                                    border: Border.all(
                                        color: _selected.contains(
                                                categories[index]['name'])
                                            ? textOrange
                                            : fieldGrey),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        categories[index]['image'],
                                        height: 25,
                                        width: 25,
                                      ),
                                      Text(
                                        categories[index]['name'],
                                        style: TextStyle(
                                            color: textOrange,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommended for you",
                  style: kW6F24O.copyWith(color: textOrange),
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  children: List.generate(
                      dashData.length,
                      (index) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 3),
                                      blurRadius: 7,
                                      spreadRadius:
                                          -2, // Set spreadRadius to a negative value
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Image.asset(
                                          index % 2 == 0 ? pngBoy : pngGirl2,
                                          height: 160,
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 5,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (fav.contains(
                                                    dashData[index]['id'])) {
                                                  setState(() {
                                                    fav.remove(
                                                        dashData[index]['id']);
                                                  });
                                                } else {
                                                  setState(() {
                                                    fav.add(
                                                        dashData[index]['id']);
                                                  });
                                                }
                                              });
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              color: fav.contains(
                                                      dashData[index]['id'])
                                                  ? Colors.red
                                                  : Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                dashData[index]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              )
                            ],
                          )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
