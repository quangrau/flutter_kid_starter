class NumberEntity {
  String text;
  String audio;

  NumberEntity({
    this.text,
    this.audio,
  });

  factory NumberEntity.fromJson(Map<String, dynamic> parsedJson) {
    return NumberEntity(
      text: parsedJson['number'],
      audio: parsedJson['audio'],
    );
  }
}
