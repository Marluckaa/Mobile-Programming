import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addUser(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance.collection("Users").doc(userId).set(userInfoMap);
  }
}

class UserModel {
  final String userId;
  final String fullName;
  final String email;
  final int phoneNo;
  final int height;
  final int weight;
  
  const UserModel({
    required this.userId,
    required this.fullName,
    required this.email, 
    required this.phoneNo,
    required this.height,
    required this.weight,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['UserId'] as String,
        fullName = json['FullName'] as String,
        email = json['Email'] as String,
        phoneNo = json['PhoneNo'] as int,
        height = json['Height'] as int,
        weight = json['Weight'] as int;

  Map<String, dynamic> toJson() {
    return {
      "UserId": userId,
      "FullName": fullName,
      "Email": email,
      "PhoneNo": phoneNo,
      "Height": height,
      "Weight": weight,
    };
  }

  UserModel copyWith({
    String? fullName,
    String? email,
    int? phoneNo,
    int? height,
    int? weight,
  }) {
    return UserModel(
      userId: this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }
}
