import 'dart:math';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_clone/constants/common_functions.dart';
import 'package:ecom_clone/constants/constant.dart';
import 'package:ecom_clone/controller/provider/address_provider.dart';
import 'package:ecom_clone/controller/provider/deal_of_the_day_provider/deal_of_the_day_provider.dart';
import 'package:ecom_clone/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:ecom_clone/model/address_model.dart';
import 'package:ecom_clone/model/product_model.dart';
import 'package:ecom_clone/utils/colors.dart';
import 'package:ecom_clone/utils/theme.dart';
import 'package:ecom_clone/view/auth_screen/user/address_screen/address_screen.dart';
import 'package:ecom_clone/view/auth_screen/user/product_category_screen/product_category_screen.dart';
import 'package:ecom_clone/view/auth_screen/user/product_screen/product_screen.dart';
import 'package:ecom_clone/view/auth_screen/user/searched_product_screen/searched_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController todaysDealsCarouselController = CarouselController();

  checkUserAddress() async {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    bool userAddressPresent = await UserDataCRUD.checkUsersAddress();
    if (userAddressPresent == false) {
      // ignore: use_build_context_synchronously
      showModalBottomSheet(
          backgroundColor: transparent,
          context: context,
          builder: (context) {
            return Container(
              height: height * .3,
              padding: EdgeInsets.symmetric(
                  vertical: height * .04, horizontal: width * .02),
              width: width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Address',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * .15,
                      width: width * .4,
                      child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const AddressScreen(),
                                        type: PageTransitionType.rightToLeft));
                              },
                              child: Container(
                                width: width * .4,
                                height: height * .15,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * .03,
                                    vertical: height * .01),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: greyShade3),
                                ),
                                alignment: Alignment.center,
                                child: Builder(builder: (context) {
                                  if (index == 0) {
                                    return Text(
                                      "Add Address",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: greyShade3),
                                    );
                                  }
                                  return Text(
                                    "Add Address",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  );
                                }),
                              ),
                            );
                          }),
                    ),
                  ]),
            );
          });
      // print("user NOt found");
    }
  }

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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserAddress();
      context.read<AddressProvider>().getCurrentSelectedAddress();
      context.read<DealOfTheDayProvider>().fetchTodaysDeal();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 228, 233),
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * .15),
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
              style: GoogleFonts.poppins(
                textStyle: textTheme.displaySmall!.copyWith(
                  color: black,
                ),
              ),
            ),
            Consumer<DealOfTheDayProvider>(
                builder: (context, dealOfTheDayProvider, child) {
              if (dealOfTheDayProvider.dealsFetched == false) {
                return Container(
                  height: height * .02,
                  width: width,
                  alignment: Alignment.center,
                  child: Text(
                    "Loading Latest Deals",
                    style: GoogleFonts.poppins(
                      textStyle: textTheme.bodySmall,
                    ),
                  ),
                );
              } else {
                return Column(children: [
                  CarouselSlider(
                    carouselController: todaysDealsCarouselController,
                    options: CarouselOptions(
                      height: height * .23,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: dealOfTheDayProvider.deals.map((i) {
                      ProductModel currentProduct = i;
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: ProductScreen(
                                          productModel: currentProduct),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        currentProduct.imagesURL![0]),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.pink),
                        child: Text(
                          "Upto 60% off",
                          style: GoogleFonts.poppins(
                            textStyle:
                                textTheme.bodyMedium!.copyWith(color: white),
                          ),
                        ),
                      ),
                      CommonFunctions.blankSpace(0, width * .03),
                      Text(
                        "Deal of the day",
                        style: GoogleFonts.poppins(
                          textStyle: textTheme.bodyMedium!
                              .copyWith(color: Colors.pink),
                        ),
                      ),
                    ],
                  ),
                  CommonFunctions.blankSpace(height * .01, 0),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20),
                    shrinkWrap: true,
                    itemCount: dealOfTheDayProvider.deals.length,
                    itemBuilder: ((context, index) {
                      ProductModel currentProduct =
                          dealOfTheDayProvider.deals[index];
                      return InkWell(
                        onTap: () {
                          todaysDealsCarouselController.animateToPage(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: greyShade3),
                            image: DecorationImage(
                                image:
                                    NetworkImage(currentProduct.imagesURL![0]),
                                fit: BoxFit.contain),
                          ),
                        ),
                      );
                    }),
                  ),
                ]);
              }
            }),
            CommonFunctions.blankSpace(height * .01, 0),
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
                borderRadius: BorderRadius.circular(30),
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
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: ProductCategoryScreen(
                          productCategory: categories[index]),
                      type: PageTransitionType.leftToRight));
            },
            child: Container(
              color: Color.fromARGB(255, 242, 228, 233),
              margin: EdgeInsets.symmetric(horizontal: width * .01),
              child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      "assets/images/categories/${categories[index]}.jpg",
                    ),
                    height: height * .07,
                  ),
                  Text(
                    categories[index],
                    style:
                        GoogleFonts.poppins(textStyle: textTheme.labelMedium),
                  ),
                ],
              ),
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
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: height * .07,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: addressBarGradientColor)),
      child: Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
          if (addressProvider.fetchedCurrentSelectedAddress == true) {
            AddressModel selectedAddress =
                addressProvider.currentSelectedAddress;
            return Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on),
                  CommonFunctions.blankSpace(0, width * .01),
                  Expanded(
                    child: Text(
                      'Deliver to ${selectedAddress.name} - ${selectedAddress.town} , ${selectedAddress.state}',
                      style:
                          GoogleFonts.poppins(textStyle: textTheme.bodySmall),
                    ),
                  ),
                ],
              ),
            );
          }
          return Consumer<AddressProvider>(
              builder: (context, addressProvider, child) {
            if (addressProvider.fetchedCurrentSelectedAddress &&
                addressProvider.addressPresent) {
              AddressModel selectedAddress =
                  addressProvider.currentSelectedAddress;
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on),
                  CommonFunctions.blankSpace(0, width * .01),
                  Text(
                    'Deliver To ${selectedAddress.name} - ${selectedAddress.town} , ${selectedAddress.state}',
                    style: textTheme.bodySmall!.copyWith(),
                  ),
                  CommonFunctions.blankSpace(0, width * .02),
                ],
              );
            } else {
              return Text(
                'Deliver To User - City , State',
                style: textTheme.bodySmall!.copyWith(),
              );
            }
          });
        },
      ),
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
      padding: EdgeInsets.symmetric(
          horizontal: width * .03, vertical: height * .001),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: appBarGradientColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "EasyBazzar",
              style: GoogleFonts.dancingScript(
                textStyle: TextStyle(
                    color: white, fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width * .8,
                  child: TextField(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: SearchedProductScreen(),
                            type: PageTransitionType.leftToRight),
                      );
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: grey,
                      ),
                      fillColor: white,
                      filled: true,
                      hintText: "Search",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: width * .03),
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
          ]),
    );
  }
}
