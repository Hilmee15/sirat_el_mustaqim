class AsmaulHusna {
  AsmaulHusna({
    required this.index,
    required this.latin,
    required this.arabic,
    required this.translation_id,
    required this.translation_en,
  });

  String index;
  String latin;
  String arabic;
  String translation_id;
  String translation_en;

  factory AsmaulHusna.fromJSON(Map<String, dynamic> json) {
    return AsmaulHusna(
        index: json['index'],
        latin: json['latin'],
        arabic: json['arabic'],
        translation_id: json['translation_id'],
        translation_en: json['translation_en'],
    );
  }
}