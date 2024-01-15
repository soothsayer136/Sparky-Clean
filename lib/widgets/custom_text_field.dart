import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/font_weight.dart';
import '../constants/textstyless.dart';

class CustomTextField extends StatelessWidget {
  String? hintText;
  Widget? suffix;
  Widget? prefix;
  TextEditingController? controller;
  FocusNode? node;
  String? label;
  bool? obscureText;
  CustomTextField(
      {super.key,
      this.obscureText = false,
      this.node,
      this.label,
      this.controller,
      this.hintText,
      this.prefix,
      this.suffix});

  InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: Colors.transparent));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? const SizedBox()
            : Text(
                label ?? "",
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18,color: textOrange),
              ),
        SizedBox(height: 8,),
        Container(
          decoration: BoxDecoration(
              color: fieldGrey, borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextFormField(
              focusNode: node,
              obscureText: obscureText!,
              controller: controller,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: hintText ?? "",
                hintStyle: kW5F24G.copyWith(fontSize: 18, fontWeight: kW7),
                enabledBorder: border,
                focusedBorder: border,
                disabledBorder: border,
                suffixIcon: suffix,
                prefixIcon: prefix,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
