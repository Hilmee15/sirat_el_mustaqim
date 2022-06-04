class KisahNabi {
  KisahNabi({
    required this.name,
    required this.thn_kelahiran,
    required this.usia,
    required this.description,
    required this.tmp,
    required this.image_url
  });

  String name;
  String thn_kelahiran;
  String usia;
  String description;
  String tmp;
  String image_url;

  factory KisahNabi.fromJSON(Map<String, dynamic> json) {
    return KisahNabi(
      name: json['name'],
      thn_kelahiran: json['thn_kelahiran'].toString(),
      usia: json['usia'].toString(),
      description: json['description'],
      tmp: json['tmp'],
      image_url: json['image_url']
    );
  }
}