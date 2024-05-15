import 'package:country_picker/country_picker.dart';
import 'package:ecom_clone/constants/common_functions.dart';
import 'package:ecom_clone/controller/services/auth_services/auth_services.dart';
import 'package:ecom_clone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  String currentCountryCode = "+91";
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 228, 233),
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
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * .03, vertical: height * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: textTheme.displaySmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              CommonFunctions.blankSpace(height * .02, 0),
              // SignIn(width, height, textTheme, context),
              // CreateAccount(width, height, textTheme, context),
              Builder(builder: (context) {
                if (inLogin) {
                  return SignIn(width, height, textTheme, context);
                }
                return CreateAccount(width, height, textTheme, context);
              }),
              CommonFunctions.blankSpace(height * .05, 0),
              BottomAuthScreenWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Container SignIn(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: greyShade3),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: greyShade3,
              border: Border(
                bottom: BorderSide(color: greyShade3),
              ),
            ),
            height: height * .06,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = false;
                    });
                  },
                  child: Container(
                    height: height * .03,
                    width: height * .03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey),
                        color: white),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: inLogin ? transparent : secondaryColor,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * .02),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create Account . ',
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: 'New to EasyBazaar ?',
                          style: textTheme.bodyMedium)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * .03, vertical: height * .01),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: height * .03,
                    width: height * .03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey),
                        color: white),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: inLogin ? secondaryColor : transparent,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * .02),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign In. ',
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: 'Already a customer',
                          style: textTheme.bodyMedium)
                    ],
                  ),
                )
              ],
            ),
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    showCountryPicker(
                        context: context,
                        onSelect: (val) {
                          setState(() {
                            currentCountryCode = "+${val.phoneCode}";
                          });
                        });
                  },
                  child: Container(
                    height: height * .06,
                    width: width * .2,
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        color: greyShade2,
                        borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: Text(
                      currentCountryCode,
                      style: textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .06,
                  width: width * .64,
                  child: TextFormField(
                    cursorColor: black,
                    // style: textTheme.displaySmall,
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mobile number',
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
                )
              ],
            ),
          ),
          CommonFunctions.blankSpace(height * .02, 0),
          CommonAuthButton(
            title: "Continue",
            onpressed: () {
              print("clicked continue");
              AuthServices.reciveOTP(
                  context: context,
                  mobileNo:
                      '$currentCountryCode${mobileController.text.trim()}');
            },
          ),
          CommonFunctions.blankSpace(height * .02, 0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'By Continuing you agree to EasyBazzar\'s ',
                    style: textTheme.labelMedium),
                TextSpan(
                    text: 'Conditions of use ',
                    style: textTheme.labelMedium!.copyWith(color: blue)),
                TextSpan(text: 'and ', style: textTheme.labelMedium),
                TextSpan(
                    text: 'Privacy Notice',
                    style: textTheme.labelMedium!.copyWith(color: blue)),
              ],
            ),
          ),
          CommonFunctions.blankSpace(height * .02, 0),
        ],
      ),
    );
  }

  Container CreateAccount(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: greyShade3),
      ),
      child: Column(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * .03, vertical: height * .01),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = false;
                    });
                  },
                  child: Container(
                    height: height * .03,
                    width: height * .03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey),
                        color: white),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: inLogin ? transparent : secondaryColor,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * .02),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create Account. ',
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: 'New to EasyBazzar',
                          style: textTheme.bodyMedium)
                    ],
                  ),
                )
              ],
            ),
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          SizedBox(
            height: height * .06,
            width: width * .88,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'First and Last Name',
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
          Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    showCountryPicker(
                        context: context,
                        onSelect: (val) {
                          setState(() {
                            currentCountryCode = "+${val.phoneCode}";
                          });
                        });
                  },
                  child: Container(
                    height: height * .06,
                    width: width * .2,
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        color: greyShade2,
                        borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: Text(
                      currentCountryCode,
                      style: textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .06,
                  width: width * .64,
                  child: TextFormField(
                    cursorColor: black,
                    // style: textTheme.displaySmall,
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mobile number',
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
                )
              ],
            ),
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .03, vertical: height * .01),
            child: Text(
              "By enrolling your mobile phone number , you concent to recieve automated security notification via text message from EasyBazaar . \nMessage and date rates may apply",
              style: textTheme.bodyMedium,
            ),
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          CommonAuthButton(
            title: "Continue",
            onpressed: () {},
          ),
          CommonFunctions.blankSpace(height * .02, 0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'By Continuing you agree to EasyBazzar\'s ',
                    style: textTheme.labelMedium),
                TextSpan(
                    text: 'Conditions of use ',
                    style: textTheme.labelMedium!.copyWith(color: blue)),
                TextSpan(text: 'and ', style: textTheme.labelMedium),
                TextSpan(
                    text: 'Privacy Notice',
                    style: textTheme.labelMedium!.copyWith(color: blue)),
              ],
            ),
          ),
          CommonFunctions.blankSpace(height * .02, 0),
          Container(
            decoration: BoxDecoration(
              color: greyShade3,
              border: Border(
                top: BorderSide(color: greyShade3),
              ),
            ),
            height: height * .06,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: height * .03,
                    width: height * .03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey),
                        color: white),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: inLogin ? secondaryColor : transparent,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * .02),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign In . ',
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: 'Already a customer',
                          style: textTheme.bodyMedium)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommonAuthButton extends StatelessWidget {
  CommonAuthButton({super.key, required this.title, required this.onpressed});
  String title;
  VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width * 8, height * .06),
          backgroundColor: secondbuttonColor),
      onPressed: onpressed,
      child: Text(
        "Continue",
        style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class BottomAuthScreenWidget extends StatelessWidget {
  const BottomAuthScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          height: 2,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [white, grey, white])),
        ),
        CommonFunctions.blankSpace(height * .02, 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Condition of use",
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              "Privacy Notice",
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              "Help",
              style: textTheme.bodyMedium!.copyWith(color: blue),
            )
          ],
        ),
        CommonFunctions.blankSpace(height * .01, 0),
        Center(
          child: Text(
            "1996-23 , EasyBazzar.com , Inc. or its affilates",
            style: textTheme.labelMedium!.copyWith(
              color: grey,
            ),
          ),
        )
      ],
    );
  }
}
