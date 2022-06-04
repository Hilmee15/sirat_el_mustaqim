class Doa {
  Doa({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
  });

  String title;
  String arabic;
  String latin;
  String translation;

  factory Doa.fromJSON(Map<String, dynamic> json) {
    return Doa(
      title: json['title'],
      arabic: json['arabic'],
      latin: json['latin'],
      translation: json['translation'],
    );
  }
}
