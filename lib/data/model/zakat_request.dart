import 'dart:convert';
import 'donation.dart';
import 'user.dart';

class ZakatRequest {
  final String id;
  final User requester;
  final String imageUrl;
  final String requestTitle;
  final String requestDescription;
  final double requestAmount;
  final List<Donation> donationList;

  ZakatRequest({
    required this.id,
    required this.requester,
    required this.imageUrl,
    required this.requestTitle,
    required this.requestDescription,
    required this.requestAmount,
    required this.donationList,
  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'requester': requester.toMap(),
      'imageUrl': imageUrl,
      'requestTitle': requestTitle,
      'requestDescription': requestDescription,
      'requestAmount': requestAmount,
      'donationList': donationList.map((x) => x.toMap()).toList(),
    };
  }

  factory ZakatRequest.fromMap(Map<String, dynamic> map) {
    return ZakatRequest(
      id: map['id'] ?? '',
      requester: User.fromMap(map['requester']),
      imageUrl: map['imageUrl'] ?? '',
      requestTitle: map['requestTitle'] ?? '',
      requestDescription: map['requestDescription'] ?? '',
      requestAmount: map['requestAmount']?.toDouble() ?? 0.0,
      donationList: List<Donation>.from(map['donationList']?.map((x) => Donation.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ZakatRequest.fromJson(String source) => ZakatRequest.fromMap(json.decode(source));
  
}
