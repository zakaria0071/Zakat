import 'dart:convert';
import 'address.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String phoneNumber;
  final Address? address;
  final String? profilePictureUrl;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    this.address,
    this.profilePictureUrl,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address?.toMap(),
      'profilePictureUrl': profilePictureUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] != null ? Address.fromMap(map['address']) : null,
      profilePictureUrl: map['profilePictureUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
