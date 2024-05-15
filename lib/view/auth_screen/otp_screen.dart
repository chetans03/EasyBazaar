import 'package:ecom_clone/constants/common_functions.dart';

import 'package:ecom_clone/controller/services/auth_services/auth_services.dart';
import 'package:ecom_clone/utils/colors.dart';
import 'package:ecom_clone/view/auth_screen/auth_screens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.mobileNumber});
  String mobileNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.1),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
              left: width * 0.03,
              right: width * 0.03,
              bottom: height * 0.012,
              top: height * 0.045),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: appBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Text(
            "EasyBazzar",
            style: GoogleFonts.dancingScript(
              textStyle: TextStyle(
                  color: white, fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: width * .03, vertical: height * .02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Authentication Required",
                style: textTheme.displayMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              CommonFunctions.blankSpace(height * .01, 0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${widget.mobileNumber}',
                      style: textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: ' Change',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              CommonFunctions.blankSpace(height * .01, 0),
              Text(
                "We have send a One Time Password (OTP) to the mobile number above . Please enter it to complete the verification.",
                style: textTheme.bodyMedium,
              ),
              CommonFunctions.blankSpace(height * .01, 0),
              SizedBox(
                child: TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    hintStyle: textTheme.bodySmall,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: secondaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey),
                    ),
                  ),
                ),
              ),
              CommonFunctions.blankSpace(height * .01, 0),
              CommonAuthButton(
                title: "Continue",
                onpressed: () {
                  AuthServices.verifyOTP(
                    context: context,
                    otp: otpController.text.trim(),
                  );
                },
              ),
              CommonFunctions.blankSpace(height * .02, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend OTP",
                      style: textTheme.bodyMedium!.copyWith(color: blue),
                    ),
                  ),
                ],
              ),
              CommonFunctions.blankSpace(height * .02, 0),
              const BottomAuthScreenWidget()
            ],
          ),
        ),
      )),
    );
  }
}
