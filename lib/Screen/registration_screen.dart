import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recpie_app/Screen/dashboard_screen.dart';
import 'package:recpie_app/app_utils.dart';
import 'package:recpie_app/widgets/input_field_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  String genderSelected = "male";

  void handleSubmit() {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String birthDate = birthDateController.text;
    String gender = genderSelected;

    if (name.isEmpty || email.isEmpty || password.isEmpty || birthDate.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All fields are required!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    "Recpie App ",
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 28.0,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                const Center(
                  child: Text(
                    "Register for Recipes",
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 28.0,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                const SizedBox(height: 50),
                Inputfield(
                  controller: nameController,
                  icon: Icons.person,
                  hintText: "Enter your name",
                ),
                const SizedBox(height: 25),
                Inputfield(
                  controller: emailController,
                  icon: Icons.email,
                  hintText: "Enter your email",
                ),
                const SizedBox(height: 25),
                Inputfield(
                  controller: passwordController,
                  icon: Icons.password,
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    style: const TextStyle(
                      color: colorWhite,
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.center,
                    controller: birthDateController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: colorWhite,
                        size: 25.0,
                      ),
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
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      ))!;
                      String dateFormatter = date.toIso8601String();
                      DateTime dt = DateTime.parse(dateFormatter);
                      var formatter = DateFormat("dd-MMM-yyyy");
                      birthDateController.text = formatter.format(dt);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            groupValue: genderSelected,
                            activeColor: colorWhite,
                            title: const Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: colorWhite,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: "male",
                            onChanged: (val) {
                              setState(() {
                                genderSelected = val.toString();
                              });
                            },
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            groupValue: genderSelected,
                            activeColor: colorWhite,
                            title: const Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: colorWhite,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: "female",
                            onChanged: (val) {
                              setState(() {
                                genderSelected = val.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorGreen,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: colorWhite,
                        fontSize: 14,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: colorGreen,
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
