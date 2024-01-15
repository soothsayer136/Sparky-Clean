import 'package:flutter/material.dart';
import 'package:sparkling_clean/constants/colors.dart';
import 'package:sparkling_clean/constants/datas.dart';
import 'package:sparkling_clean/constants/font_weight.dart';
import 'package:sparkling_clean/constants/textstyless.dart';
import 'package:sparkling_clean/routes/routes_generator.dart';
import 'package:sparkling_clean/screens/payment/payment_screen.dart';
import 'package:sparkling_clean/widgets/custom_buttons.dart';
import 'package:sparkling_clean/widgets/leading.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key});
  static const String routeName = "/service-detail";

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Leading(),
          title: Text(
            "Deep House Cleaning",
            style: kW6F24O.copyWith(color: textOrange),
          ),
          centerTitle: true,
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            children: [
              ...List.generate(serviceDetail.length, (index) {
                var data = serviceDetail[index];
                return Column(
                  children: [
                    ListTile(
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      visualDensity:
                          VisualDensity(vertical: 0, horizontal: -4.0),
                      leading: Image.asset(
                        data['image'],
                        height: 50,
                        width: 50,
                      ),
                      title: Text(data['name'],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              if (data['count'] > 1) {
                                setState(() {
                                  data['count']--;
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 3, color: Colors.black)),
                              child: Icon(Icons.remove),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            data['count'].toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (data['count'] < 10) {
                                setState(() {
                                  data['count']++;
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                      child: Container(
                        color: textGrey,
                        height: 2,
                        width: double.infinity,
                      ),
                    ),

                  ],
                );
              }),

              SizedBox(height: 30,),
              CustomButton(
                backgroundColor: textOrange,
                  onPressed: (){
                  RouteGenerator.navigateTo(PaymentScreen.routeName);},
                buttonName: "Continue",
              ),

              SizedBox(height: 20,),
            ]));
  }
}
