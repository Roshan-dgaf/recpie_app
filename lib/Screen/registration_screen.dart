import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recpie_app/app_utils.dart';
import 'package:recpie_app/widgets/input_field_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController birthDatecontroller = TextEditingController();

  String genderSelecterd = "male";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text(
              "Roshan",
              style: TextStyle(
                color: colorWhite,
                fontSize: 28.0,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            const SizedBox(
              height: 8.0,
             ),
             const Center(
              child: Text(
                "of akk trades",
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 28.0,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                
                ),
              ),
             ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
             ),
             const Center(
              child: Text(
                "Please Enter Your Information",
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 14.0,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                
                ),
              ),
             ),
             const SizedBox(height: 50,),
             Inputfield(
              controller: namecontroller,
              icon: Icons.person,
              hintText: ("Enter your name"),),

             const SizedBox(height: 25,),
             Inputfield(
             controller: emailcontroller,
              icon: Icons.email,
              hintText: ("Enter your email"),),

             const SizedBox(height: 25,),
              Inputfield(
             controller: passwordcontroller,
              icon: Icons.password,
              hintText: ("Enter your password"),
              obscureText: true,),
              
             const SizedBox(height: 25,),

              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 20),
                child: TextFormField(
                  style: const TextStyle(
                    color: colorWhite,
                    fontFamily: "Montserrat",
                  ),
                  textAlign: TextAlign.center,
                  controller: birthDatecontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month, color: colorWhite, size: 25.0,),
                    hintText: "Enter your Birthday",
                    hintStyle: TextStyle(
                      color: colorGrey,
                      fontSize: 14.0,
                      fontFamily: "Montserrat",
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorWhite),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorWhite),
                  ),
                ),
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = (await showDatePicker(
                    context: context,
                    initialDate: DateTime.now() ,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100)))!;
                    String dateFormatter = date .toIso8601String();
                    DateTime dt = DateTime.parse(dateFormatter);
                    var formatter = DateFormat("dd-MMM-yyyy");
                    birthDatecontroller.text = formatter.format(dt);

                },
              ),

            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Gender",
                  style: TextStyle(
                    color: colorWhite,
                    letterSpacing: 1,
                    fontSize: 14.0,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                
                  ),
                
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Flexible(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        groupValue: genderSelecterd,
                        activeColor: colorWhite,
                        title: const Text("Male",
                         style: TextStyle(
                          fontSize: 14.0,
                          color: colorWhite,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,

                         ),),
                         value: "male",
                         onChanged: (val){
                          setState(() {
                            genderSelecterd = val.toString();
                          });
                          print(genderSelecterd);
                         },
                      ))
                  ],)
              ],
            )
          ],
        ),
      )
       

    );
  }
}
