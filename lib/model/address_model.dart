import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  String? name;
  String? mobileNumber;
  String? authenticatedMobilenumber; // do not include textfield for this
  String? houseNumber;
  String? area;
  String? landmark;
  String? pincode;
  String? town;
  String? state;
  String? docID;
  bool? isDefault;
  AddressModel({
    this.name,
    this.mobileNumber,
    this.authenticatedMobilenumber,
    this.houseNumber,
    this.area,
    this.landmark,
    this.pincode,
    this.town,
    this.state,
    this.docID,
    this.isDefault,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mobileNumber': mobileNumber,
      'authenticatedMobilenumber': authenticatedMobilenumber,
      'houseNumber': houseNumber,
      'area': area,
      'landmark': landmark,
      'pincode': pincode,
      'town': town,
      'state': state,
      'docID': docID,
      'isDefault': isDefault,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map['name'] != null ? map['name'] as String : null,
      mobileNumber:
          map['mobileNumber'] != null ? map['mobileNumber'] as String : null,
      authenticatedMobilenumber: map['authenticatedMobilenumber'] != null
          ? map['authenticatedMobilenumber'] as String
          : null,
      houseNumber:
          map['houseNumber'] != null ? map['houseNumber'] as String : null,
      area: map['area'] != null ? map['area'] as String : null,
      landmark: map['landmark'] != null ? map['landmark'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as String : null,
      town: map['town'] != null ? map['town'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      docID: map['docID'] != null ? map['docID'] as String : null,
      isDefault: map['isDefault'] != null ? map['isDefault'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
