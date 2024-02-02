import 'package:ecom_clone/controller/services/auth_services/auth_services.dart';

import 'package:ecom_clone/view/auth_screen/auth_screens.dart';
import 'package:ecom_clone/view/auth_screen/user/user_persistent_nav_bar/user_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkAuthenticated() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated
        ? Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const UserBottomNavBar(),
                type: PageTransitionType.rightToLeft),
            (route) => false)
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: AuthScreen(), type: PageTransitionType.rightToLeft),
            (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        checkAuthenticated();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage("assets/images/easybazaar_splash_screen.png"),
        fit: BoxFit.fill,
      ),
    );
  }
}
