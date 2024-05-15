// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:ecom_clone/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:ecom_clone/utils/colors.dart';
import 'package:ecom_clone/view/auth_screen/auth_screens.dart';
import 'package:ecom_clone/view/auth_screen/seller/seller_persistent_nav_bar/seller_bottom_nav_bar.dart';
import 'package:ecom_clone/view/auth_screen/user/user_data_screen/user_data_input.dart';
import 'package:ecom_clone/view/auth_screen/user/user_persistent_nav_bar/user_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../../controller/services/auth_services/auth_services.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkUser() async {
    bool userAlreadyThere = await UserDataCRUD.checkUser();
    // log(userAlreadyThere.toString());
    if (userAlreadyThere == true) {
      bool userIsSeller = await UserDataCRUD.userIsSeller();
      log('start');
      log(userIsSeller.toString());
      if (userIsSeller == true) {
        Navigator.push(
          context,
          PageTransition(
            child: const SellerBottomNavBar(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      } else {
        Navigator.push(
          context,
          PageTransition(
            child: const UserBottomNavBar(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      }
    } else {
      Navigator.push(
        context,
        PageTransition(
          child: const UserDataInputScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    }
  }

  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated
        ? checkUser()
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const AuthScreen(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: appBarGradientColor,
          radius: .3,
        ),
      ),
      child: Center(
        child: Text(
          "EasyBazzar",
          style: GoogleFonts.dancingScript(
            textStyle: TextStyle(
                color: white, fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ));
  }
}
