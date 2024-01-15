import 'package:flutter/material.dart';
import 'package:sparkling_clean/constants/app_image.dart';
import 'package:sparkling_clean/constants/colors.dart';
import 'package:sparkling_clean/routes/routes_generator.dart';
import 'package:sparkling_clean/widgets/custom_buttons.dart';
import 'package:sparkling_clean/widgets/custom_text_field.dart';
import 'package:sparkling_clean/widgets/leading.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  static const String routeName = "/payment";
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Leading(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                pngVisa,
                height: 50,
                width: 50,
              ),
              Image.asset(
                pngMaster,
                height: 50,
                width: 50,
              ),
              Image.asset(
                pngPaypal,
                height: 50,
                width: 50,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          CustomTextField(
            label: "Cardholder Name",
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: "Card Number",
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                label: "End Date",
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: CustomTextField(
                label: "CVV",
              ))
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    RouteGenerator.goBack();
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: textOrange, width: 2)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: textOrange,
                            ),
                            Text(
                              " BACK",
                              style: TextStyle(
                                  color: textOrange, fontWeight: FontWeight.w600),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: textOrange,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: textOrange, width: 2)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "NEXT ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
