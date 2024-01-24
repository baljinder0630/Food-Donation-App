String timeAgo(DateTime date) {
  Duration diff = DateTime.now().difference(date);
  if (diff.inSeconds < 60) {
    return '${diff.inSeconds} secs ago';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes} mins ago';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} hrs ago';
  } else if (diff.inDays < 30) {
    return '${diff.inDays} days ago';
  } else if (diff.inDays < 365) {
    return '${(diff.inDays / 30).round()} mth ago';
  } else {
    return '${(diff.inDays / 365).round()} yrs ago';
  }
}
