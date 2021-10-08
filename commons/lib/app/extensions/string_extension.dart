extension StringExtension on String {
  ///
  /// Remove special characters
  ///
  String normalize() {
    return toLowerCase()
        .replaceAll(RegExp(r'(á|ã|à)'), 'a')
        .replaceAll(RegExp(r'(é|ẽ|è)'), 'e')
        .replaceAll(RegExp(r'(í|ĩ|ì)'), 'i')
        .replaceAll(RegExp(r'(ó|õ|ò)'), 'o')
        .replaceAll(RegExp(r'(ù|ũ|ù)'), 'u');
  }

  ///
  /// Make a string's first character uppercase
  ///
  String capitalize() => this[0].toUpperCase() + substring(1);

  ///
  /// Format for title
  /// Ex: `the title` -> `The Title`
  ///
  String title() =>
      split(' ').map((e) => e.toLowerCase().capitalize()).join(' ');

  /// Get the first letter of words, in uppercase
  /// Ex: `Jackie Chan` -> `JC`
  ///
  String firstLetterOfWordsInUppercase() =>
      split(' ').map((e) => e[0].toUpperCase()).join('');
}
