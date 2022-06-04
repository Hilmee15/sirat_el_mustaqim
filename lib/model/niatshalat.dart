class NiatShalat {
  NiatShalat({
    required this.id,
    required this.name,
    required this.arabic,
    required this.latin,
    required this.terjemahan,
  });

  int id;
  String name;
  String arabic;
  String latin;
  String terjemahan;

  factory NiatShalat.fromJSON(Map<String, dynamic> json) {
    return NiatShalat(
      id: json['id'],
      name: json['name'],
      arabic: json['arabic'],
      latin: json['latin'],
      terjemahan: json['terjemahan'],
    );
  }
}
