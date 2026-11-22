import 'package:dio/dio.dart';
import 'package:news_application/models/user_model.dart';

class AuthService {
  final Dio _dio = Dio();
  Future<RegisterUserResponse> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",

        data: {
          'Name': name,
          'Email': email,
          'Phone': phone,
          'password': password,
        },
      );
      return RegisterUserResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }

  Future<RegisterUserResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {'Email': email, 'password': password},
      );
      return RegisterUserResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }
}
