import 'package:flutter/material.dart';
import 'package:logehub/HomePage/DashBoard.dart';
import 'package:logehub/AppBar/AppBar.dart';
import 'package:logehub/Classes/Entity/user.dart';
import 'package:logehub/Classes/Functions/userFunctions.dart';
//import 'package:your_app_name/login/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreen extends StatefulWidget {
  final String verificationid, phoneNo;

  OTPScreen(String string,
      {super.key, required this.verificationid, required this.phoneNo});

  @override
  State<OTPScreen> createState() => _OTPScreenState(verificationid, phoneNo);
}

class _OTPScreenState extends State<OTPScreen> {
  String verificationId, phoneNo;
  TextEditingController otpController = TextEditingController(text: "1111");
  TextEditingController otpVerificationController = TextEditingController();
  LoginUser user = LoginUser();

  _OTPScreenState(this.verificationId, this.phoneNo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogEHubAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Please provide your OTP"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter the OTP",
                  suffixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
              onPressed: () async {
                otpVerificationController.text = verificationId;
                if (verificationId.toString() ==
                    otpController.text.toString()) {
                  //Save the Phone No and Validate
                  otpVerificationController.text =
                      "OTP has been Verified. \n Redirecting to Dashboard.";

                  try {
                    //Check user Profile as per the Phone No
                    var check =
                        await (UserFunctions()).checkPhoneNo(phoneNo).then;

                    otpVerificationController.text = check.toString();

                    if (check != null) {
                      otpVerificationController.text = user.name.toString();

                      //Save the phone no in Shared Preferences
                      saveCredentials();

                      //The phone no is not in the database
                      if (user.phoneNo.isEmpty) {
                        otpVerificationController.text =
                            "Could not Get or Register User";

                        //Save Phone Number in Database
                        //final List<dynamic> response =
                        //    await UserFunctions().savePhoneNo(phoneNo);
                        user.phoneNo = phoneNo;

                        /*if (response[0].toString() == "200" ||
                            response[0].toString() == "201") {
                          //Navigate to the Profile Page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfileScreen()));
                        } else {
                          otpVerificationController.text = "${response[0]}";
                        }*/
                      }

                      //If Name and Email Id are not present, redirect to the Profile Page
                      //Else go to the Dashboard
                      if (user.name.trim().isEmpty) {
                        /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));*/
                        otpVerificationController.text = "Profile";
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        otpVerificationController.text =
                            user.name.trim().toString();
                      }
                    }
                    //If User Name is already present go to Dashboard
                  } on Exception catch (error) {
                    otpVerificationController.text = error.toString();
                  }
                }
                // Else Goto Save Company Name and User Name Page
                else {
                  //Put up the Error.
                  otpVerificationController.text =
                      "It is Not the same $verificationId :: ${otpController.text}";
                }
              },
              child: const Text("Verify OTP")),
          TextField(
            controller: otpVerificationController,
            readOnly: true,
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Future<void> saveCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("phoneno", phoneNo);
    prefs.setString("username", user.name);
  }
}
