import 'dart:developer';

import 'package:ecom_clone/constants/common_functions.dart';
import 'package:ecom_clone/constants/constant.dart';
import 'package:ecom_clone/model/user_model.dart';
import 'package:ecom_clone/view/auth_screen/signinLogic.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class UserDataCRUD {
  static addUser(
      {required UserModel userModel, required BuildContext context}) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.phoneNumber)
          .set(userModel.toMap())
          .whenComplete(() {
        log('Data added');
        CommonFunctions.showToast(
            context: context, message: "User Added Successfully");
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const SignInLogic(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(context: context, message: e.toString());
    }
  }

  static Future<bool> checkUser() async {
    bool userPresent = false;
    try {
      await firestore
          .collection('users')
          .where('mobileNum', isEqualTo: auth.currentUser!.phoneNumber)
          .get()
          .then((value) {
        value.size > 0 ? userPresent = true : userPresent = false;
        log(value.toString());
      });
    } catch (e) {
      log(e.toString());
    }
    log(userPresent.toString());
    return userPresent;
  }
}
