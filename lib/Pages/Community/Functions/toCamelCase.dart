String toCamelCase(String text) {
  return text.toLowerCase().split(RegExp(r'[_\s]')).map((word) {
    return word[0].toUpperCase() + word.substring(1);
  }).join(' ');
}
