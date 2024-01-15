import 'package:flutter/material.dart';
import 'package:sparkling_clean/constants/app_image.dart';
import 'package:sparkling_clean/constants/datas.dart';

import '../../constants/colors.dart';
import '../../constants/textstyless.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Booking",
          style: kW6F24O.copyWith(color: textOrange),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          ...List.generate(bookings.length, (index) {
            var data = bookings[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: fieldGrey, borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['service'],
                        style: kW6F24O.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          height: 2,
                          width: double.infinity,
                          color: textGrey.withOpacity(0.3),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(flex: 2, child: Image.asset(data['image'])),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['name'],
                                    style: kW6F24O.copyWith(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                  Text(
                                    data['date'],
                                    style: kW6F24O.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: textGrey),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          data['price'] + "\$",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          height: 2,
                          width: double.infinity,
                          color: textGrey.withOpacity(0.3),
                        ),
                      ),
                      Center(
                          child: InkWell(
                        onTap: () {
                          setState(() {
                            bookings.removeAt(index);
                          });
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: textOrange,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
