import 'package:flutter/material.dart';
import 'package:sparkling_clean/constants/colors.dart';

class SingleMenu extends StatelessWidget {
  String ? label;
  IconData? icon;
  SingleMenu({super.key, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
        leading: Container(
            decoration: const BoxDecoration(color: fieldGrey, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.indigo,
              ),
            )),
    title: Text(label ?? '',style:  const TextStyle(
        fontWeight: FontWeight.w600,
        color: textOrange,
        fontSize: 16
    ),),
    );
  }
}
