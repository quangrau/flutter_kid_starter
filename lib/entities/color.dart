class ColorEntity {
  String colorCode;
  String colorName;

  ColorEntity({
    this.colorCode,
    this.colorName,
  });

  factory ColorEntity.fromJson(Map<String, dynamic> parsedJson) {
    return ColorEntity(
      colorCode: parsedJson['code'],
      colorName: parsedJson['name'],
    );
  }
}
