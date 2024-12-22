extension CapitalizeWords on String {
  String capitalizeWords() {
    if (isEmpty) {
      return this;
    }

    // Split the string into words
    List<String> words = split(' ');

    // Capitalize each word and join them back into a single string
    List<String> capitalizedWords = words.map((word) {
      if (word.isEmpty) return word;
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).toList();

    return capitalizedWords.join(' ');
  }
}
