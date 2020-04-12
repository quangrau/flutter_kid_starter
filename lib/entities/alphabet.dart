class AlphabetEntity {
  String text;
  String audio;

  AlphabetEntity({
    this.text,
    this.audio,
  });

  factory AlphabetEntity.fromJson(Map<String, dynamic> parsedJson) {
    return AlphabetEntity(
      text: parsedJson['text'],
      audio: parsedJson['audio'],
    );
  }
}
