import 'dart:convert';

class ZakatInIslam {
  final String id;
  final String? narrationInArabic;
  final String? narrationInEnglish;
  final String? narrationInBengali;
  final String narrationFrom;

  //properties for Quran
  final String? nameOfSurah;
  final String? noOfStartingAyah;
  final String? noOfEndingAyah;

  //properties for Hadith
  final String? bookName;
  final String? hadithNo;
  final String? grade;


  ZakatInIslam({
    required this.id,
    this.narrationInArabic,
    this.narrationInEnglish,
    this.narrationInBengali,
    required this.narrationFrom,
    this.nameOfSurah,
    this.noOfStartingAyah,
    this.noOfEndingAyah,
    this.bookName,
    this.hadithNo,
    this.grade,
  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'narrationInArabic': narrationInArabic,
      'narrationInEnglish': narrationInEnglish,
      'narrationInBengali': narrationInBengali,
      'narrationFrom': narrationFrom,
      'nameOfSurah': nameOfSurah,
      'noOfStartingAyah': noOfStartingAyah,
      'noOfEndingAyah': noOfEndingAyah,
      'bookName': bookName,
      'hadithNo': hadithNo,
      'grade': grade,
    };
  }

  factory ZakatInIslam.fromMap(Map<String, dynamic> map) {
    return ZakatInIslam(
      id: map['id'] ?? '',
      narrationInArabic: map['narrationInArabic'],
      narrationInEnglish: map['narrationInEnglish'],
      narrationInBengali: map['narrationInBengali'],
      narrationFrom: map['narrationFrom'] ?? '',
      nameOfSurah: map['nameOfSurah'],
      noOfStartingAyah: map['noOfStartingAyah'],
      noOfEndingAyah: map['noOfEndingAyah'],
      bookName: map['bookName'],
      hadithNo: map['hadithNo'],
      grade: map['grade'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ZakatInIslam.fromJson(String source) => ZakatInIslam.fromMap(json.decode(source));
}