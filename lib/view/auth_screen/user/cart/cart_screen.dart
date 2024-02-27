import 'package:ecom_clone/constants/common_functions.dart';
import 'package:ecom_clone/utils/colors.dart';
import 'package:ecom_clone/view/auth_screen/user/home/home_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * .08),
          child: HomePageAppBar(width: width, height: height),
        ),
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * .02, vertical: height * .02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Subtotal ",
                        style: textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text: "₹53529",
                        style: textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                CommonFunctions.blankSpace(height * .01, width),
                SizedBox(
                  height: height * .06,
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: teal,
                      ),
                      CommonFunctions.blankSpace(0, width * .01),
                      Expanded(
                        child: Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "Your order id eligible for FREE Delivery. ",
                                    style: textTheme.bodySmall!
                                        .copyWith(color: teal),
                                  ),
                                  TextSpan(
                                    text: "Select this at checkout",
                                    style: textTheme.bodySmall!.copyWith(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(width, height * .06),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.yellow),
                  child: Text(
                    "Proceed to Buy",
                    style: textTheme.bodyMedium,
                  ),
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                CommonFunctions.divider(),
                CommonFunctions.blankSpace(height * .02, 0),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: height * .27,
                      width: width,
                      padding: EdgeInsets.symmetric(
                          horizontal: width * .02, vertical: height * .01),
                      margin: EdgeInsets.symmetric(vertical: height * .01),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: greyShade1),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                      "assets/images/todays_deals/todaysDeal1.png",
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  CommonFunctions.blankSpace(height * .01, 0),
                                  Container(
                                    height: height * .06,
                                    width: width * .4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: grey),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                    color: greyShade3),
                                              ),
                                            ),
                                            child: const Icon(Icons.remove),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            alignment: Alignment.center,
                                            color: white,
                                            child: const Text("1"),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                        color: greyShade3),
                                                  ),
                                                ),
                                                child: const Icon(Icons.add)))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            CommonFunctions.blankSpace(0, width * .03),
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Product name",
                                    style: textTheme.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                  CommonFunctions.blankSpace(height * .01, 0),
                                  Text(
                                    "₹4799",
                                    style: textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Eligible for FREE Delivery",
                                    style: textTheme.bodySmall!
                                        .copyWith(color: grey),
                                  ),
                                  Text(
                                    "In Stock",
                                    style: textTheme.bodySmall!
                                        .copyWith(color: teal),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            minimumSize:
                                                Size(width * .02, height * .04),
                                            side: BorderSide(color: grey),
                                            backgroundColor: white,
                                            foregroundColor: black),
                                        onPressed: () {},
                                        child: const Text(
                                          "Delete",
                                        ),
                                      ),
                                      CommonFunctions.blankSpace(
                                          0, width * .02),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            minimumSize:
                                                Size(width * .02, height * .04),
                                            side: BorderSide(color: grey),
                                            backgroundColor: white,
                                            foregroundColor: black),
                                        onPressed: () {},
                                        child: const Text(
                                          "Save for later",
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        minimumSize:
                                            Size(width * .02, height * .04),
                                        side: BorderSide(color: grey),
                                        backgroundColor: white,
                                        foregroundColor: black),
                                    onPressed: () {},
                                    child: const Text(
                                      "See more like this",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
