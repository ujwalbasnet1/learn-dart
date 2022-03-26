import 'package:dio/dio.dart';

class ApiFailure extends DioError {
  final List<String>? errors;
  final RequestOptions requestOptions;

  ApiFailure({this.errors, required this.requestOptions})
      : super(requestOptions: requestOptions);

  String get failure => errors!.join('\n');

  factory ApiFailure.fromJson(
    Map<String, dynamic> json,
    RequestOptions requestOptions,
  ) {
    return ApiFailure(
      requestOptions: requestOptions,
      errors: json['errors'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    return data;
  }
}
