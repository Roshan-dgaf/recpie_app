
import 'package:flutter/material.dart';
import 'package:recpie_app/app_utils.dart';

class Inputfield extends StatelessWidget {
  const Inputfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final hintText;
  final IconData icon;
  final bool obscureText;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 20.0),
      child: TextFormField(
       keyboardType: TextInputType.emailAddress,
       obscureText: obscureText,
       controller: controller,
       style: const TextStyle(
         color: colorWhite,
         fontFamily: "Montserrat"
       ),
       textAlign: TextAlign.center,
       cursorColor: colorWhite,
       decoration:  InputDecoration(
         isDense: true,
         prefixIcon:  Icon(
           icon,
           color: colorWhite,
           size: 25.0,),
           focusColor: colorWhite,
           hintText: hintText,
           hintStyle: const TextStyle(
             color: colorGrey,
             fontSize: 12.0,
             fontFamily: "Montserrat"
           ),
           focusedBorder: const UnderlineInputBorder(
             borderSide: BorderSide(color: colorWhite),
           ),
           border: const UnderlineInputBorder(
             borderSide: BorderSide(color: colorWhite),
           ),
           contentPadding: const EdgeInsets.only(top: 15.0),
       ),
      ),
    );
  }
}