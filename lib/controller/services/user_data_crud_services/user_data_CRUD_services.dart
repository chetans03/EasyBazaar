import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_clone/constants/common_functions.dart';
import 'package:ecom_clone/constants/constant.dart';
import 'package:ecom_clone/model/address_model.dart';
import 'package:ecom_clone/model/user_model.dart';
import 'package:ecom_clone/view/auth_screen/signinLogic.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uuid/uuid.dart';

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

  static Future addUserAddress(
      {required BuildContext context,
      required AddressModel addressModel,
      required docID}) async {
    try {
      await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection("address")
          .doc(docID)
          .set(addressModel.toMap())
          .whenComplete(() {
        log('Data added');
        CommonFunctions.showToast(
            context: context, message: "Address Added Successfully");
        Navigator.pop(context);
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(context: context, message: e.toString());
    }
  }

  static Future<bool> checkUsersAddress() async {
    bool addressPresent = false;
    try {
      await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection("address")
          .get()
          .then((value) {
        value.size > 0 ? addressPresent = true : addressPresent = false;
        log(value.toString());
      });
    } catch (e) {
      print("erros is");
      log(e.toString());
    }
    log(addressPresent.toString());
    return addressPresent;
  }

  static Future<List<AddressModel>> getAllAddress() async {
    List<AddressModel> allAddress = [];
    AddressModel defaultAddress = AddressModel();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .get();

      snapshot.docs.forEach((element) {
        allAddress.add(AddressModel.fromMap(element.data()));
        AddressModel currentAddress = AddressModel.fromMap(element.data());
        if (currentAddress.isDefault == true) {
          defaultAddress = currentAddress;
        }
      });
    } catch (e) {
      log('error found');
      log(e.toString());
    }

    for (var data in allAddress) {
      log(data.toMap().toString());
    }
    return allAddress;
  }

  static Future getCurrentSelectedAddress() async {
    AddressModel defaultAddress = AddressModel();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .get();

      snapshot.docs.forEach((element) {
        AddressModel currentAddress = AddressModel.fromMap(element.data());
        if (currentAddress.isDefault == true) {
          defaultAddress = currentAddress;
        }
      });
    } catch (e) {
      log('error found');
      log(e.toString());
    }
    return defaultAddress;
  }
}
