class RegisterUserResponse {
  bool status;
  String message;
  UserModel? user;

  RegisterUserResponse({
    required this.message,
    required this.status,
    this.user,
  });
  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    return RegisterUserResponse(
      message: json['message'],
      status: json['status'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }
}

class UserModel {
  final int id;
  final String name;
  final String phone;
  final String password;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.password,
    required this.email,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      password: json['password'],
      email: json['email'],
    );
  }
}
//{
//"city": "Cairo",
// "prayers": [
// {
//"name": "Fajr"
//}, {
//"name": "Dhuhr"
//}
//]
//}

// class Prayers {
//   String name;
//   Prayers({required this.name});
//   factory Prayers.fromJson(Map<String, dynamic> json) {
//     return Prayers(name: json['name']);
//   }
// }

// class ResponsePrayer {
//   String city;
//   List<Prayers> prayers;
//   ResponsePrayer({required this.city, required this.prayers});
//   factory ResponsePrayer.fromJson(Map<String, dynamic> json) {
//     return ResponsePrayer(
//       city: json['city'],
//       prayers: (json['prayers'] as List)
//           .map((e) => Prayers.fromJson(e))
//           .toList(),
//     );
//   }
// }

// {
//   "success": true,
//   "data": { "id": 1, "title": "Fajr", "time": "04:30" }
// }z

// class Prayer {
//   bool success;
//   PrayerData data;
//   Prayer({required this.success, required this.data});

//   factory Prayer.fromJson(Map<String, dynamic> json) {
//     return Prayer(
//       success: json['success'],
//       data: PrayerData.fromJson(json['data']),
//     );
//   }
// }

// class PrayerData {
//   int id;
//   String title;
//   String time;

//   PrayerData({required this.id, required this.time, required this.title});
//   factory PrayerData.fromJson(Map<String, dynamic> json) {
//     return PrayerData(id: json['id'], time: json['time'], title: json['title']);
//   }
// }
