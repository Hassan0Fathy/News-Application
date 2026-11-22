import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_application/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  String? message;
  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    isLoading = true;
    message = null;
    notifyListeners();
    try {
      final result = await _authService.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      isLoading = false;

      message = result.message;
      notifyListeners();
      return result.status;
    } on DioException catch (e) {
      isLoading = false;
      message = e.toString();
      notifyListeners();
      //throw Exception(e.response?.data['message'] ?? e.message);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> login({required String email, required String password}) async {
    isLoading = true;
    message = null;
    notifyListeners();
    try {
      final result = await _authService.login(email: email, password: password);
      isLoading = false;

      message = result.message;
      notifyListeners();
      return result.status;
    } on DioException catch (e) {
      isLoading = false;
      message = "$e Something Wrong";
      notifyListeners();
      //throw Exception(e.response?.data['message'] ?? e.message);
      return false;
    }
  }
}
