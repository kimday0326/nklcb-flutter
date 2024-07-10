class Keyword {
  final String name;
  final int value;

  Keyword({required this.name, required this.value});

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      name: json['word'],
      value: json['value'],
    );
  }
}
