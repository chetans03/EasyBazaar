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
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserGreetingsYou(
                    width: width, textTheme: textTheme, height: height),
                CommonFunctions.blankSpace(height * .01, 0),
                YouGridBtons(width: width, textTheme: textTheme),
                CommonFunctions.blankSpace(height * .01, 0),
                UserOrders(width: width, height: height, textTheme: textTheme),
                CommonFunctions.blankSpace(height * .01, 0),
                CommonFunctions.divider(),
                KeepShopping(
                    width: width, height: height, textTheme: textTheme),
                CommonFunctions.blankSpace(height * .01, 0),
                CommonFunctions.divider(),
                BuyAgain(width: width, height: height, textTheme: textTheme)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuyAgain extends StatelessWidget {
  const BuyAgain({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Buy Again",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: textTheme.bodySmall!.copyWith(color: blue),
                ),
              )
            ],
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          SizedBox(
            height: height * .14,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: height * .14,
                    height: height * .14,
                    margin: EdgeInsets.symmetric(horizontal: width * .02),
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(10)),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class KeepShopping extends StatelessWidget {
  const KeepShopping({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Keep Shopping For",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Browsing History",
                  style: textTheme.bodySmall!.copyWith(color: blue),
                ),
              )
            ],
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: .9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: 5,
            itemBuilder: ((context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Text(
                    "Product",
                    style: textTheme.bodySmall,
                  )
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}

class UserOrders extends StatelessWidget {
  const UserOrders({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Orders",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: textTheme.bodySmall!.copyWith(color: blue),
                ),
              )
            ],
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          SizedBox(
            height: height * .17,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: width * .4,
                    height: height * .17,
                    margin: EdgeInsets.symmetric(horizontal: width * .02),
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(10)),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class UserGreetingsYou extends StatelessWidget {
  const UserGreetingsYou({
    super.key,
    required this.width,
    required this.textTheme,
    required this.height,
  });

  final double width;
  final TextTheme textTheme;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'Hello , ', style: textTheme.bodyLarge),
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
    );
  }
}

class YouGridBtons extends StatelessWidget {
  const YouGridBtons({
    super.key,
    required this.width,
    required this.textTheme,
  });

  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 3.4,
          mainAxisSpacing: 10),
      shrinkWrap: true,
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: greyShade3),
          alignment: Alignment.center,
          child: Builder(
            builder: (context) {
              if (index == 0) {
                return Text(
                  "Your Orders",
                  style: textTheme.bodyMedium,
                );
              }
              if (index == 1) {
                return Text(
                  "Buy Again",
                  style: textTheme.bodyMedium,
                );
              }
              if (index == 2) {
                return Text(
                  "Your Account",
                  style: textTheme.bodyMedium,
                );
              }

              return Text(
                "Your Wishlist",
                style: textTheme.bodyMedium,
              );
            },
          ),
        );
      },
    );
  }
}
