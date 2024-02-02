import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  String phoneNumber = '';
  String verificationId = '';
  String otp = '';

  upDatePhoneNum({required String num}) {
    phoneNumber = num;
    notifyListeners();
  }

  upDateverificationId({required String verID}) {
    verificationId = verID;
    notifyListeners();
  }
}
