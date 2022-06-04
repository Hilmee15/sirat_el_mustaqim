class BacaanShalat {
  BacaanShalat({
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

  factory BacaanShalat.fromJSON(Map<String, dynamic> json) {
    return BacaanShalat(
      id: json['id'],
      name: json['name'],
      arabic: json['arabic'],
      latin: json['latin'],
      terjemahan: json['terjemahan'],
    );
  }
}
