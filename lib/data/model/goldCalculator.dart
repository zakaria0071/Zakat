import 'dart:convert';
class GoldCalculator{
  String? id;
  String? productName;
  String? productPrice;
  DateTime? priceDate;
  GoldCalculator(
  {
  this.id,
  required this.productName,
  this.productPrice,
    this.priceDate,
  });
  GoldCalculator copyWith(
  {
    String? id,
    String? productName,
    String? productPrice,
    DateTime? priceDate,

  }
      ){
    // TODO: implement copyWith
   return GoldCalculator(
    id: id ?? this.id,
       productName: productName ?? this.productName,
       productPrice: productPrice ?? this.productPrice,
       priceDate: priceDate ?? this.priceDate,
    );
  }
  Map<String, dynamic> toMap() {
    return{
      'id': id,
      'productName': productName,
      'productPrice': productPrice,
      'priceDate': priceDate,
    };
  }
  factory GoldCalculator.fromMap(Map<String, dynamic> map) {
    return GoldCalculator(
        id: map['id'],
        productName: map['productName'],
        productPrice: map['productPrice'],
      priceDate: map['priceDate'] !=null? DateTime.parse(map['priceDate']):null,

    );
  }
  String toJson()=> json.encode(toMap());
  factory GoldCalculator.formJson(String source) => GoldCalculator.fromMap(json.decode(source));

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;
    {
      return other is GoldCalculator && other.id == id &&
    other.productName == productName &&
    other.productPrice == productPrice &&
    other.priceDate == priceDate;


    }
  }



}