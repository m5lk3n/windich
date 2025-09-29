// https://www.geeksforgeeks.org/how-to-capitalize-the-first-letter-of-a-string-in-flutter/
extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String scramble() {
    if (isEmpty) return this;
    int half = (length / 2).ceil();
    return substring(0, half) + '*' * (length - half);
  }
}