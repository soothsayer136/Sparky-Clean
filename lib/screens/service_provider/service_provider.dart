import 'package:flutter/material.dart';
import 'package:sparkling_clean/constants/colors.dart';
import 'package:sparkling_clean/constants/datas.dart';
import 'package:sparkling_clean/constants/font_weight.dart';
import 'package:sparkling_clean/constants/textstyless.dart';
import 'package:sparkling_clean/routes/routes_generator.dart';
import 'package:sparkling_clean/screens/service_detail/service_detail.dart';
import 'package:sparkling_clean/widgets/custom_buttons.dart';
import 'package:sparkling_clean/widgets/leading.dart';

class ServiceProvider extends StatefulWidget {
  const ServiceProvider({super.key});
  static const String routeName = "/service";

  @override
  State<ServiceProvider> createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // leading: const Leading(),
        title: Text("Service Provider",style: kW6F24O.copyWith(color: textOrange),),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
        children: List.generate(serviceProvider.length, (index) {
          var data = serviceProvider[index];
          return Padding(
            padding: const EdgeInsets.only(bottom:  18.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Image.asset(data['image'])),
                    SizedBox(width: 10,),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        Text(data['name'],style: const TextStyle(fontSize: 17,fontWeight: kW6),),
                        Text(data['service'],style: const TextStyle(fontSize: 16,fontWeight: kW4,color: Color(0xFF706969)),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.star,color: Colors.yellow,),
                            Text(data['rating'],style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: CustomButton(
                                height: 40,
                                backgroundColor: textOrange,
                              buttonName: "Book",
                                onPressed: (){
                                  RouteGenerator.navigateTo(ServiceDetailScreen.routeName);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          );
        })
      ),
    );
  }
}
