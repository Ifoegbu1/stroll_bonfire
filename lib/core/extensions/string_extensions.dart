extension StringExtensions on String {
  String removeWhitespaces() {
    return replaceAll(RegExp(r'\s+'), '');
  }
}

extension StringToDouble on String {
  double makeDouble() {
    try {
      return double.parse(this);
    } catch (e) {
      return 0.0; // Return a default value if parsing fails
    }
  }
}

extension StringCasingExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
