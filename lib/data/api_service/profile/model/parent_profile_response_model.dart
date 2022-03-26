import 'dart:convert';

class ParentProfileResponseModel {
  String? id;
  String? remarks;
  String? userId;
  User? uUser;

  ParentProfileResponseModel({this.id, this.remarks, this.userId, this.uUser});

  ParentProfileResponseModel.fromJson(Map<String, dynamic> json) {
    print(jsonEncode(json));
    id = json['id'];
    remarks = json['remarks'];
    userId = json['userId'];
    uUser =
        json['__user__'] != null ? new User.fromJson(json['__user__']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['remarks'] = this.remarks;
    data['userId'] = this.userId;
    if (this.uUser != null) {
      data['__user__'] = this.uUser!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? username;
  String? fullName;
  Null image;
  String? email;
  String? phoneNumber;
  Null address;
  int? otpCode;
  int? forgotPasswordOtp;
  Null cardNumber;
  int? cardPinNumber;
  int? cardMinimumLimit;
  int? availableBalance;
  String? updatedAt;
  String? createdAt;

  User(
      {this.id,
      this.username,
      this.fullName,
      this.image,
      this.email,
      this.phoneNumber,
      this.address,
      this.otpCode,
      this.forgotPasswordOtp,
      this.cardNumber,
      this.cardPinNumber,
      this.cardMinimumLimit,
      this.availableBalance,
      this.updatedAt,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['full_name'];
    image = json['image'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    otpCode = json['otp_code'];
    forgotPasswordOtp = json['forgot_password_otp'];
    cardNumber = json['card_number'];
    cardPinNumber = json['card_pin_number'];
    cardMinimumLimit = json['card_minimum_limit'];
    availableBalance = json['available_balance'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['full_name'] = this.fullName;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['otp_code'] = this.otpCode;
    data['forgot_password_otp'] = this.forgotPasswordOtp;
    data['card_number'] = this.cardNumber;
    data['card_pin_number'] = this.cardPinNumber;
    data['card_minimum_limit'] = this.cardMinimumLimit;
    data['available_balance'] = this.availableBalance;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
