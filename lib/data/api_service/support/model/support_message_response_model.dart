class SupportMessageResponseModel {
  String? id;
  String? subject;
  String? description;
  List<String>? attachments;
  String? userId;
  String? createdAt;
  String? updatedAt;
  List<Replies>? lReplies;

  SupportMessageResponseModel(
      {this.id,
      this.subject,
      this.description,
      this.attachments,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.lReplies});

  SupportMessageResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    description = json['description'];
    attachments = json['attachments']?.cast<String>();
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['__replies__'] != null) {
      lReplies = [];
      json['__replies__'].forEach((v) {
        lReplies!.add(new Replies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['description'] = this.description;
    data['attachments'] = this.attachments;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.lReplies != null) {
      data['__replies__'] = this.lReplies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Replies {
  String? id;
  String? description;
  List<String>? attachments;
  String? supportId;
  String? userId;
  User? uUser;

  Replies(
      {this.id,
      this.description,
      this.attachments,
      this.supportId,
      this.userId,
      this.uUser});

  Replies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    attachments = json['attachments']?.cast<String>();
    supportId = json['supportId'];
    userId = json['userId'];
    uUser =
        json['__user__'] != null ? new User.fromJson(json['__user__']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['attachments'] = this.attachments;
    data['supportId'] = this.supportId;
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
  String? image;
  String? email;
  String? phoneNumber;
  String? address;
  int? otpCode;
  int? forgotPasswordOtp;
  String? cardNumber;
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
