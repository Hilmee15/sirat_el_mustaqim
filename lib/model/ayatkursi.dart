class AyatKursi {
  AyatKursi({
    required this.arabic,
    required this.latin,
    required this.translation,
  });

  String arabic;
  String latin;
  String translation;

  factory AyatKursi.fromJSON(Map<String, dynamic> json) {
    return AyatKursi(
      arabic: json['arabic'],
      latin: json['latin'],
      translation: json['translation'],
    );
  }
}
