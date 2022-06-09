import 'dart:convert';

import 'package:zakat_frontend/data/model/user.dart';


class Donation {
  User donor;
  double donationAmount;

  Donation({
    required this.donor,
    required this.donationAmount,
  });


  Map<String, dynamic> toMap() {
    return {
      'donor': donor.toMap(),
      'donationAmount': donationAmount,
    };
  }

  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      donor: User.fromMap(map['donor']),
      donationAmount: map['donationAmount']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Donation.fromJson(String source) => Donation.fromMap(json.decode(source));
}
