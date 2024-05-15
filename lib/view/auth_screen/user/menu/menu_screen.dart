import 'package:ecom_clone/constants/common_functions.dart';
import 'package:ecom_clone/utils/colors.dart';
import 'package:ecom_clone/view/auth_screen/user/home/home_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * .15),
          child: HomePageAppBar(width: width, height: height),
        ),
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * .03, vertical: height * .02),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                  itemCount: 18,
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: .7),
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/menu_pics/$index.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: greyShade1),
                      ),
                    );
                  }),
                ),
                CommonFunctions.blankSpace(height * .02, 0),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        width: width,
                        height: height * .06,
                        margin: EdgeInsets.symmetric(vertical: height * .005),
                        padding: EdgeInsets.symmetric(
                            vertical: height * .005, horizontal: width * .02),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: teal)),
                        child: Row(
                          children: [
                            Text(
                              index == 0 ? "Settings" : "Customer Service",
                              style: textTheme.bodyMedium,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: black,
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
