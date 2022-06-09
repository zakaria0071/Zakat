import 'dart:convert';

class Address {
  final String id;
  final String zila;
  final String upzila;
  
  Address({
    required this.id,
    required this.zila,
    required this.upzila,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'zila': zila,
      'upzila': upzila,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] ?? '',
      zila: map['zila'] ?? '',
      upzila: map['upzila'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source));
}
