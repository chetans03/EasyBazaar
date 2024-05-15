// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
final picker = ImagePicker();
// const String keySecret = '<Razorpay Key Secrets>';
// const String keyID = '<Razorpay Key ID>';

List<String> categories = [
  'Electronics',
  'Home',
  'Mobiles',
  'Fashion',
  'Deals',
  'Travel',
  'Beauty',
  'Furniture',
  'Pharmacy',
  'Movies',
  'Books',
  'Appliances',
];

List<String> carouselPictures = [
  '1.jpg',
  '2.jpg',
  '3.jpg',
  '4.jpg',
  '5.jpg',
  '6.jpg',
  '7.jpg',
  '8.jpg',
];

List<String> todaysDeals = [
  'todaysDeal0.png',
  'todaysDeal1.png',
  'todaysDeal2.png',
  'todaysDeal3.png',
];

List<String> headphonesDeals = [
  'bose.png',
  'boat.png',
  'sony.png',
  'onePlus.png',
];

List<String> clothingDealsList = [
  'kurta.png',
  'tops.png',
  't_shirts.png',
  'view_all.png',
];

List<String> productCategories = [
  'Select Category',
  'Electronics',
  'Home',
  'Mobiles',
  'Fashion',
  'Travel',
  'Beauty',
  'Furniture',
  'Pharmacy',
  'Movies',
  'Grocery',
  'Books',
  'More'
];
