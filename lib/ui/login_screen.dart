import 'dart:math';
import 'package:doctime/ui/otp_verification_screen.dart';
import 'package:flutter/material.dart';

DateTime now = DateTime.now();
String otpcode = (1000 + Random().nextInt((9999 + 1) - 1000)).toString();

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  final String pageName = 'loginPage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numberController = TextEditingController();
  List<String> countryCode = ['Bd(+88)', 'kuwait(+965)', 'India(+9)'];
  String selectdCountryCode = 'Bd(+88)';
  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Center(
                child: SizedBox(
                  height: 60,
                  width: 320,
                  child: Image.asset(
                    'assets/ci-logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                  child: Text(
                'Your safety is our priority',
                style: TextStyle(fontSize: 35),
              )),
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Put your mobile number',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 140,
                    // color: Colors.red,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        labelText: 'Code',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      child: DropdownButton(
                          borderRadius: BorderRadius.circular(3),
                          elevation: 10,
                          value: selectdCountryCode,
                          items: countryCode.map((String code) {
                            return DropdownMenuItem(
                                value: code, child: Text(code));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectdCountryCode = newValue!;
                            });
                          }),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Mobile number*',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Center(
                  child: SizedBox(
                height: 50,
                width: 360,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // side: BorderSide(), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(5)),
                      // padding:
                      //     EdgeInsets.all(10) //content padding inside button
                    ),
                    onPressed: () {
                      if (numberController.text.isNotEmpty) {
                        DateTime now = DateTime.now();
                        String otpcode =
                            (1000 + Random().nextInt((9999 + 1) - 1000))
                                .toString();
                        code = otpcode;
                        number = numberController.text;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Your CIKITSA OTP code is $otpcode.',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 3),
                          // action: SnackBarAction(
                          //   label: 'ACTION',
                          //   onPressed: () {},
                          // ),
                        ));
                        Navigator.pushReplacementNamed(
                            context, OtpVerificatonScreen.pageName);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Please Enter your valid number',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 3),
                        ));
                      }
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 18),
                    )),
              )),
              const SizedBox(height: 15),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'or, login by using password',
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    )),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Click')),
                  const Text(
                    'to register as a doctor',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
