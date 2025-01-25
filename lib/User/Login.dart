import 'package:flutter/material.dart';
import 'package:logehub/AppBar/AppBar.dart';
import 'package:logehub/User/OtpScreen.dart';
import 'dart:math';
import 'package:dio/dio.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<Login> {
  TextEditingController phoneController =
      TextEditingController(text: "9930953147");
  TextEditingController pinController = TextEditingController();
  TextEditingController validatePinController = TextEditingController();
  TextEditingController errorController = TextEditingController();
  final dio = Dio();
  bool bDebug = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogEHubAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  prefix: const Text("+91"),
                  suffixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24))),
            ),
          ),
          const SizedBox(height: 90),
          ElevatedButton(
              onPressed: () async {
                errorController.text = "";

                //Validate Phone No
                if (phoneController.text.length != 10) {
                  errorController.text = "Please provide 10 digit Phone No.";
                } else {
                  pinController.text =
                      (1000 + Random().nextInt(9000)).toString();
                  //Send the OTP to the Mobile phone
                  if (!bDebug) {
                    final response = await dio.get(
                        'https://2factor.in/API/V1/0e1c5bf6-e208-11ee-8cbb-0200cd936042/SMS/+91${phoneController.text}/${pinController.text}/opt');
                    debugPrint("Response Data ${response.data}");
                    if (response.data
                        .toString()
                        .toUpperCase()
                        .contains("SUCCESS")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPScreen("",
                                  verificationid: pinController.text,
                                  phoneNo: phoneController.text)));
                    }
                  } else {
                    //Send the Phone Number to the database
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OTPScreen("",
                                verificationid: "1111",
                                phoneNo: phoneController.text)));
                  }
                }
              },
              child: const Text("Verify Phone Number")),
          TextField(
            controller: errorController,
            readOnly: true,
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
