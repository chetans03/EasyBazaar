import 'package:ecom_clone/constants/common_functions.dart';
import 'package:ecom_clone/constants/constant.dart';
import 'package:ecom_clone/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:ecom_clone/model/user_model.dart';
import 'package:ecom_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserDataInputScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneController.text = auth.currentUser!.phoneNumber ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, height * .08),
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * .03, vertical: height * .01),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: appBarGradientColor,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image:
                      const AssetImage("assets/images/amazon_black_logo.png"),
                  height: height * .04,
                ),
              ],
            ),
          ),
        ),
        body: Container(
          // height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * .03, vertical: height * .01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Enter your name",
                style: textTheme.displayMedium,
              ),
              CommonFunctions.blankSpace(height * .01, 0),
              TextField(
                cursorColor: black,
                // style: textTheme.displaySmall,
                controller: nameController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
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
              CommonFunctions.blankSpace(height * .01, 0),
              Text(
                "Phone Number",
                style: textTheme.displayMedium,
              ),
              CommonFunctions.blankSpace(height * .01, 0),
              TextField(
                cursorColor: black,
                readOnly: true,
                // style: textTheme.displaySmall,
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
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
              const Spacer(),
              ElevatedButton(
                  onPressed: () async {
                    UserModel userModel = UserModel(
                        name: nameController.text.trim(),
                        mobileNum: phoneController.text.trim(),
                        userType: 'user');
                    await UserDataCRUD.addUser(
                        userModel: userModel, context: context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: amber,
                      minimumSize: Size(width, height * .06)),
                  child: Text(
                    "Proceed",
                    style: textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
