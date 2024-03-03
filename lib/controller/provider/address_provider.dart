import 'package:ecom_clone/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:ecom_clone/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressModel> allAddressModel = [];
  AddressModel currentSelectedAddress = AddressModel();
  bool fetchedCurrentSelectedAddress = false;
  bool fetchAllAddress = false;

  getAllAddress() async {
    allAddressModel = await UserDataCRUD.getAllAddress();
    fetchAllAddress = true;
    notifyListeners();
  }

  getCurrentSelectedAddress() async {
    currentSelectedAddress = await UserDataCRUD.getCurrentSelectedAddress();
    fetchedCurrentSelectedAddress = true;
    notifyListeners();
  }
}
