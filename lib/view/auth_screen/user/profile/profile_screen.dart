import 'package:ecom_clone/constants/common_functions.dart';
import 'package:ecom_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              children: [
                Image(
                  image:
                      const AssetImage("assets/images/amazon_black_logo.png"),
                  height: height * .04,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: black,
                    size: height * .035,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: black,
                    size: height * .035,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: height * .02),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .04),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Hello , ', style: textTheme.bodyLarge),
                          TextSpan(
                              text: 'Sanjay',
                              style: textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: greyShade3,
                      radius: height * .025,
                    ),
                  ],
                ),
              ),
              CommonFunctions.blankSpace(height * .01, 0),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: width * .04),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3,
                    mainAxisSpacing: 10),
                shrinkWrap: true,
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, intdex) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50), color: grey),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
