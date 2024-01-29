String nameProfile(String name) {
  var nameParts = name.split(" ");
  var initials = "";

  if (nameParts.length > 0 && nameParts[0].isNotEmpty) {
    initials += nameParts[0].substring(0, 1).toUpperCase();
  }

  if (nameParts.length > 1 && nameParts[1].isNotEmpty) {
    initials += nameParts[1].substring(0, 1).toUpperCase();
  }
  return initials;
}
