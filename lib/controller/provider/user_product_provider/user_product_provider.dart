import 'package:ecom_clone/controller/services/product_services/product_services.dart';
import 'package:ecom_clone/controller/services/user_product_services/user_product_services.dart';
import 'package:ecom_clone/model/product_model.dart';
import 'package:flutter/material.dart';

class UsersProductProvider extends ChangeNotifier {
  List<ProductModel> searchedProducts = [];
  bool productFetched = false;

  emptySearchedProductsList() {
    searchedProducts = [];
    notifyListeners();
  }

  getSearchedProducts({required String productName}) async {
    searchedProducts = [];
    searchedProducts = await UsersProductService.getProducts(productName);
    productFetched = true;
    notifyListeners();
  }
}
