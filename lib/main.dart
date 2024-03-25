import 'package:ecom_clone/controller/provider/address_provider.dart';
import 'package:ecom_clone/controller/provider/auth_provider/auth_provider.dart';
import 'package:ecom_clone/controller/provider/deal_of_the_day_provider/deal_of_the_day_provider.dart';
import 'package:ecom_clone/controller/provider/product_by_category_provider/product_by_category_provider.dart';
import 'package:ecom_clone/controller/provider/product_provider/product_provider.dart';
import 'package:ecom_clone/controller/provider/user_product_provider/user_product_provider.dart';
import 'package:ecom_clone/firebase_options.dart';
import 'package:ecom_clone/utils/theme.dart';
import 'package:ecom_clone/view/auth_screen/signinLogic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Authprovider>(
          create: (_) => Authprovider(),
        ),
        ChangeNotifierProvider<AddressProvider>(
          create: (_) => AddressProvider(),
        ),
        ChangeNotifierProvider<SellerProductProvider>(
          create: (_) => SellerProductProvider(),
        ),
        ChangeNotifierProvider<UsersProductProvider>(
          create: (_) => UsersProductProvider(),
        ),
        ChangeNotifierProvider<DealOfTheDayProvider>(
          create: (_) => DealOfTheDayProvider(),
        ),
        ChangeNotifierProvider<ProductsBasedOnCategoryProvider>(
          create: (_) => ProductsBasedOnCategoryProvider(),
        ),
      ],
      child: MaterialApp(
          theme: theme, debugShowCheckedModeBanner: false, home: SignInLogic()
          // UserDataInputScreen()
          ),
    );
  }
}
