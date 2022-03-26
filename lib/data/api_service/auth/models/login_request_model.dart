class LoginRequestModel {
  String? phoneNumber;
  String? password;

  LoginRequestModel({this.phoneNumber, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.phoneNumber;
    data['password'] = this.password;
    return data;
  }
}
