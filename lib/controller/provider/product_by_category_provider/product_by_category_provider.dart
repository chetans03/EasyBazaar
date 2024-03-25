import 'package:ecom_clone/controller/services/user_product_services/user_product_services.dart';
import 'package:flutter/material.dart';

import '../../../model/product_model.dart';

class ProductsBasedOnCategoryProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  bool productsFetched = false;

  fetchProducts({required String category}) async {
    products = [];
    products = await UsersProductService.fetchProductBasedOnCategory(
        category: category);
    productsFetched = true;
    notifyListeners();
  }
}
