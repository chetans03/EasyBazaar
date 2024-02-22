import 'dart:math';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_clone/constants/common_functions.dart';
import 'package:ecom_clone/constants/constant.dart';
import 'package:ecom_clone/utils/colors.dart';
import 'package:ecom_clone/utils/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController todaysDealsCarouselController = CarouselController();
  headphoneDeal(int index) {
    switch (index) {
      case 0:
        return 'Bose';
      case 1:
        return 'boAt';
      case 2:
        return 'Sony';
      case 3:
        return 'Oneplus';
    }
  }

  clothingDeal(int index) {
    switch (index) {
      case 0:
        return 'Kurtas, sarees & more';
      case 1:
        return 'Tops , dresses & more';
      case 2:
        return 'T-shirts , jeans & more';
      case 3:
        return 'View all';
    }
  }

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenAddressBar(height: height, width: width),
              CommonFunctions.divider(),
              HomeScreenCategoriesList(
                  height: height, width: width, textTheme: textTheme),
              CommonFunctions.blankSpace(0, height * .01),
              HomeScreenBanner(height: height),
              TodaysDealHomeScreenWidget(
                  todaysDealsCarouselController: todaysDealsCarouselController),
              CommonFunctions.divider(),
              CommonFunctions.blankSpace(height * .01, 0),
              OtherOfferGridWidget(
                  title: "Latest Launches in Headphones",
                  txtBtnName: "Explore More",
                  productPicNameList: headphonesDeals,
                  offerFor: 'headphones'),
              CommonFunctions.divider(),
              Container(
                width: height * .5,
                height: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/offersNsponcered/insurance.png"),
                      fit: BoxFit.fill),
                ),
              ),
              CommonFunctions.divider(),
              OtherOfferGridWidget(
                  title: "Minimum 70% off || Top offers on clothing",
                  txtBtnName: "See all deals",
                  productPicNameList: clothingDealsList,
                  offerFor: 'clothing'),
              CommonFunctions.divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonFunctions.blankSpace(height * .01, 0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .03),
                    child: Text(
                      "Watch Sixer only on mini TV",
                      style: textTheme.displaySmall!.copyWith(
                        color: black,
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * .5,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .01),
                    child: const Image(
                      image: AssetImage(
                          "assets/images/offersNsponcered/sixer.png"),
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container OtherOfferGridWidget(
      {required String title,
      required String txtBtnName,
      required List<String> productPicNameList,
      required String offerFor}) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width * .03, vertical: height * .01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.displaySmall!.copyWith(
              color: black,
            ),
          ),
          CommonFunctions.blankSpace(height * .01, 0),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/offersNsponcered/${productPicNameList[index]}"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Text(
                      offerFor == 'headphones'
                          ? headphoneDeal(index)
                          : clothingDeal(index),
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            }),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              txtBtnName,
              style: textTheme.bodySmall!
                  .copyWith(color: blue, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class TodaysDealHomeScreenWidget extends StatelessWidget {
  const TodaysDealHomeScreenWidget({
    super.key,
    required this.todaysDealsCarouselController,
  });

  final CarouselController todaysDealsCarouselController;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * .03, vertical: height * .01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFunctions.blankSpace(0, height * .1),
            Text(
              "50%-80% off || Latest deals",
              style: textTheme.displaySmall!.copyWith(
                color: black,
              ),
            ),
            CarouselSlider(
              carouselController: todaysDealsCarouselController,
              options: CarouselOptions(
                height: height * .23,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
              items: todaysDeals.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/todays_deals/$i",
                            ),
                            fit: BoxFit.fitHeight),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            CommonFunctions.blankSpace(height * .01, 0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: red),
                  child: Text(
                    "Upto 60% off",
                    style: textTheme.bodyMedium!.copyWith(color: white),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * .03),
                Text(
                  "Deal of the day",
                  style: textTheme.bodyMedium!.copyWith(color: red),
                ),
              ],
            ),
            CommonFunctions.blankSpace(height * .01, 0),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 20),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    todaysDealsCarouselController.animateToPage(index);
                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyShade3),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/todays_deals/${todaysDeals[index]}"),
                          fit: BoxFit.contain),
                    ),
                  ),
                );
              }),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See all deals",
                style: textTheme.bodySmall!
                    .copyWith(color: blue, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height * .23,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
      items: carouselPictures.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/carousel_slideshow/$i",
                    ),
                    fit: BoxFit.cover),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  const HomeScreenCategoriesList({
    super.key,
    required this.height,
    required this.width,
    required this.textTheme,
  });

  final double height;
  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .1,
      width: width,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: width * .01),
            child: Column(
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/categories/${categories[index]}.png",
                  ),
                  height: height * .07,
                ),
                Text(
                  categories[index],
                  style: textTheme.labelMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeScreenAddressBar extends StatelessWidget {
  const HomeScreenAddressBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .07,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: addressBarGradientColor)),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width * .03, vertical: height * .01),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: appBarGradientColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * .8,
            child: TextField(
              onTap: () {},
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: grey,
                ),
                fillColor: white,
                filled: true,
                hintText: "Search",
                contentPadding: EdgeInsets.symmetric(horizontal: width * .03),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
        ],
      ),
    );
  }
}
