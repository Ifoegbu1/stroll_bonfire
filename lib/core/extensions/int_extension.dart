extension IntToString on int {
  /// Converts an integer (0-9) to its English word representation.
  String toWord() {
    final numberWords = [
      'zero',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
    ];

    if (this >= 0 && this <= 9) {
      return numberWords[this];
    } else {
      throw RangeError("Only integers between 0 and 9 are supported.");
    }
  }
}
