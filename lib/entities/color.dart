class ColorEntity {
  String code;
  String name;
  String audio;

  ColorEntity({
    this.code,
    this.name,
    this.audio,
  });

  factory ColorEntity.fromJson(Map<String, dynamic> parsedJson) {
    return ColorEntity(
      code: parsedJson['code'],
      name: parsedJson['name'],
      audio: parsedJson['audio'],
    );
  }
}
