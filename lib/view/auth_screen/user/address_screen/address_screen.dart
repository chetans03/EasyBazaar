import 'package:ecom_clone/constants/common_functions.dart';
import 'package:ecom_clone/constants/constant.dart';
import 'package:ecom_clone/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:ecom_clone/model/address_model.dart';
import 'package:ecom_clone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController stateController = TextEditingController();

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
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * .03, vertical: height * .01),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonFunctions.blankSpace(height * .02, 0),
                AddressScreenTextField(
                  textcontroller: nameController,
                  title: 'Enter your name',
                  hintText: 'Enter your name',
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                AddressScreenTextField(
                  textcontroller: mobileController,
                  title: 'Enter your Mobile number',
                  hintText: 'Mobile number',
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                AddressScreenTextField(
                  textcontroller: houseController,
                  title: 'Enter your House No.',
                  hintText: 'House no.',
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                AddressScreenTextField(
                  textcontroller: areaController,
                  title: 'Enter your Area',
                  hintText: 'Area',
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                AddressScreenTextField(
                  textcontroller: landmarkController,
                  title: 'Enter your LandMark',
                  hintText: 'LandMark',
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                AddressScreenTextField(
                  textcontroller: pincodeController,
                  title: 'Enter your PINCODE',
                  hintText: 'Pincode',
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                AddressScreenTextField(
                  textcontroller: townController,
                  title: 'Enter your Town',
                  hintText: 'Town',
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                AddressScreenTextField(
                  textcontroller: stateController,
                  title: 'Enter your State',
                  hintText: 'State',
                ),
                CommonFunctions.blankSpace(height * .04, 0),
                ElevatedButton(
                  onPressed: () {
                    Uuid uuid = Uuid();
                    String docID = uuid.v1();
                    AddressModel addressModel = AddressModel(
                      name: nameController.text.trim(),
                      mobileNumber: mobileController.text.trim(),
                      authenticatedMobilenumber: auth.currentUser!.phoneNumber,
                      houseNumber: houseController.text.trim(),
                      area: areaController.text.trim(),
                      landmark: landmarkController.text.trim(),
                      pincode: pincodeController.text.trim(),
                      town: townController.text.trim(),
                      state: stateController.text.trim(),
                      docID: docID,
                      isDefault: true,
                    );

                    UserDataCRUD.addUserAddress(
                        context: context,
                        addressModel: addressModel,
                        docID: docID);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: amber,
                    minimumSize: Size(width, height * .06),
                  ),
                  child: Text(
                    "Add Address",
                    style: textTheme.bodyMedium,
                  ),
                ),
                CommonFunctions.blankSpace(height * .04, 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressScreenTextField extends StatelessWidget {
  const AddressScreenTextField(
      {super.key,
      required this.textcontroller,
      required this.title,
      required this.hintText});

  final TextEditingController textcontroller;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodySmall,
        ),
        CommonFunctions.blankSpace(height * .01, 0),
        TextField(
          cursorColor: black,

          // style: textTheme.displaySmall,
          controller: textcontroller,

          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: width * .02),
            hintText: hintText,
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
      ],
    );
  }
}
