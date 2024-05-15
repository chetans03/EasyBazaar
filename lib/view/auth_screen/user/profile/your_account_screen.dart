import 'package:ecom_clone/constants/common_functions.dart';

import 'package:ecom_clone/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:ecom_clone/model/address_model.dart';
import 'package:ecom_clone/utils/colors.dart';

import 'package:ecom_clone/view/auth_screen/user/user_persistent_nav_bar/user_bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YourAccount extends StatefulWidget {
  const YourAccount({super.key});

  @override
  State<YourAccount> createState() => _YourAccountState();
}

class _YourAccountState extends State<YourAccount> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 228, 233),
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.1),
        child: Container(
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
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * .02, vertical: height * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Account",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            CommonFunctions.blankSpace(height * .01, 0),
            CircleAvatar(
              maxRadius: 40,
              child: Image.asset("assets/images/profile.jpg"),
            ),
            CommonFunctions.blankSpace(height * .01, 0),
            FutureBuilder(
                future: UserDataCRUD.getName(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      "Name- ${snapshot.data}",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  }
                  return const Text("No logged in User");
                }),
            CommonFunctions.blankSpace(height * .01, 0),
            FutureBuilder(
              future: UserDataCRUD.mobileNum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Mobile- ${snapshot.data}",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                }
                return const Text("");
              },
            ),
            CommonFunctions.blankSpace(height * .01, 0),
            FutureBuilder(
              future: UserDataCRUD.getAddress(),
              builder: (context, snapshot) {
                AddressModel addressModel = snapshot.data;
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pin- ${addressModel.pincode}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      CommonFunctions.blankSpace(height * .01, 0),
                      Text(
                        "House- ${addressModel.houseNumber}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      CommonFunctions.blankSpace(height * .01, 0),
                      Text(
                        "Area- ${addressModel.area}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      CommonFunctions.blankSpace(height * .01, 0),
                      Text(
                        "Landmark- ${addressModel.landmark}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      CommonFunctions.blankSpace(height * .01, 0),
                      Text(
                        "State- ${addressModel.state}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Text("");
              },
            ),
            CommonFunctions.blankSpace(height * .03, 0),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: secondbuttonColor,
                minimumSize: Size(
                  width,
                  height * 0.06,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                ),
              ),
              child: Text(
                "Logout",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
