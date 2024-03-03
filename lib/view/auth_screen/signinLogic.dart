import 'package:ecom_clone/controller/services/auth_services/auth_services.dart';
import 'package:ecom_clone/controller/services/user_data_crud_services/user_data_CRUD_services.dart';

import 'package:ecom_clone/view/auth_screen/auth_screens.dart';
import 'package:ecom_clone/view/auth_screen/user/user_data_screen/user_data_input.dart';
import 'package:ecom_clone/view/auth_screen/user/user_persistent_nav_bar/user_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  chechUser() async {
    bool userAlreadyThere = await UserDataCRUD.checkUser();
    if (userAlreadyThere) {
      Navigator.push(
        context,
        PageTransition(
            child: UserBottomNavBar(), type: PageTransitionType.rightToLeft),
      );
    } else {
      Navigator.push(
        context,
        PageTransition(
            child: UserDataInputScreen(), type: PageTransitionType.rightToLeft),
      );
    }
  }

  checkAuthenticated() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated
        ? chechUser()
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
