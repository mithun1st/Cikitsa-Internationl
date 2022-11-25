import 'dart:math';

import 'package:doctime/home_page.dart';
import 'package:flutter/material.dart';

late String code;
late String number;

class OtpVerificatonScreen extends StatefulWidget {
  static final String pageName = 'OtpPage';
  OtpVerificatonScreen({super.key});

  @override
  State<OtpVerificatonScreen> createState() => _OtpVerificatonScreenState();
}

class _OtpVerificatonScreenState extends State<OtpVerificatonScreen> {
  TextEditingController fController = TextEditingController();
  TextEditingController sController = TextEditingController();
  TextEditingController thController = TextEditingController();
  TextEditingController fourController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'Verification Code',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const Text(
                'Please enter OTP code that sent to your mobile in the\n box below.',
                style: TextStyle(fontSize: 16),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Text(
                'OTP code sent to $number',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: fController,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      //textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // labelText: 'Mobile number*',
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

                      onChanged: ((value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).nextFocus();
                        }
                      }),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: sController,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // labelText: 'Mobile number*',
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
                      onChanged: ((value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).nextFocus();
                        }
                      }),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: thController,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // labelText: 'Mobile number*',
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
                      onChanged: ((value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).nextFocus();
                        }
                      }),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: fourController,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // labelText: 'Mobile number*',
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
                      onChanged: ((value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).unfocus();
                        }
                      }),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Center(
                  child: SizedBox(
                height: 50,
                width: 360,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // enabledMouseCursor: MouseCursor.defer,
                      // side: BorderSide(), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(5)),
                      // padding:
                      //     EdgeInsets.all(10) //content padding inside button
                    ),
                    onPressed: () {
                      String combinedCode =
                          '${fController.text}${sController.text}${thController.text}${fourController.text}';
                      if (combinedCode == code) {
                        Navigator.pushReplacementNamed(
                            context, MyHomePage.pageName);
                      } else {
                        fController.clear();
                        sController.clear();
                        thController.clear();
                        fourController.clear();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Please Enter valid code or press resend button.',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                          // action: SnackBarAction(
                          //   label: 'ACTION',
                          //   onPressed: () {},
                          // ),
                        ));
                      }
                    },
                    child: const Text(
                      'CONFIRM CODE',
                      style: TextStyle(fontSize: 18),
                    )),
              )),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    DateTime now = DateTime.now();
                    String otpcode =
                        (1000 + Random().nextInt((9999 + 1) - 1000)).toString();
                    code = otpcode;

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
                  },
                  child: const Text('Resend OTP'))
            ],
          ),
        ),
      )),
    );
  }
}
