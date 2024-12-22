extension CapitalizeWords on String {
  String capitalizeWords() {
    if (isEmpty) {
      return this;
    }

    List<String> words = split(' ');

    List<String> capitalizedWords = words.map((word) {
      if (word.isEmpty) return word;
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).toList();

    return capitalizedWords.join(' ');
  }
}
