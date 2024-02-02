import 'dart:developer';
import 'package:ecom_clone/controller/provider/auth_provider/auth_provider.dart';
import 'package:ecom_clone/view/auth_screen/otp_screen.dart';
import 'package:ecom_clone/view/auth_screen/signinLogic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthServices {
  static bool checkAuthentication() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  static reciveOTP({required BuildContext context, required mobileNo}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    print("inside recive otp");
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNo,
        verificationCompleted: (PhoneAuthCredential credential) {
          log(credential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
        },
        codeSent: (String verificationId, int? resendToked) {
          context
              .read<Authprovider>()
              .upDateverificationId(verID: verificationId);
          Navigator.push(
            context,
            PageTransition(
                child: OTPScreen(mobileNumber: mobileNo),
                type: PageTransitionType.rightToLeft),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static verifyOTP({required BuildContext context, required String otp}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<Authprovider>().verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        PageTransition(
            child: SignInLogic(), type: PageTransitionType.rightToLeft),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
