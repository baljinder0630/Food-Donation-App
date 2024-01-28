import 'dart:developer';

String toCamelCase(String str) {
  // Using replace method with RegExp
  str = str.replaceAllMapped(RegExp(r'(?:^\w|[A-Z]|\b\w)'), (Match match) {
    return match.group(0) == str[0]
        ? match.group(0)!.toLowerCase()
        : match.group(0)!.toUpperCase();
  }).replaceAll(RegExp(r'\s+'), ' ');
  if (str.isNotEmpty) {
    str = str[0].toUpperCase() + str.substring(1);
  }
  return str;
}
