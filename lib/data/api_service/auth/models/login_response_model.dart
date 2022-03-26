class LoginResponseModel {
  String? accessToken;
  Payload? payload;

  LoginResponseModel({this.accessToken, this.payload});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class Payload {
  String? email;
  String? id;
  String? username;
  String? phoneNumber;
  List<Roles>? roles;
  String? image;

  Payload(
      {this.email,
      this.id,
      this.username,
      this.phoneNumber,
      this.roles,
      this.image});

  Payload.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['username'] = this.username;
    data['phone_number'] = this.phoneNumber;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    return data;
  }
}

class Roles {
  int? roleCode;
  String? roleDescription;

  Roles({this.roleCode, this.roleDescription});

  Roles.fromJson(Map<String, dynamic> json) {
    roleCode = json['role_code'];
    roleDescription = json['role_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role_code'] = this.roleCode;
    data['role_description'] = this.roleDescription;
    return data;
  }
}
