import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _loading = false;

  bool get isLoading => _loading;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
    return;
  }

  String? _failure;

  String? get failure => _failure;

  bool get hasFailure => _failure != null;

  setFailure(String? failure) {
    _failure = failure;
    notifyListeners();
    return;
  }
}
