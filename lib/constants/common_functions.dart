import 'package:ecom_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class CommonFunctions {
  static blankSpace(double? height, double? width) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
    );
  }

  static divider() {
    return Divider(
      color: grey,
      thickness: 3,
      height: 0,
    );
  }
}
