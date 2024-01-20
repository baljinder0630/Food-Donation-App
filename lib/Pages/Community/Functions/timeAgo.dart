String timeAgo(DateTime date) {
  Duration diff = DateTime.now().difference(date);
  if (diff.inSeconds < 60) {
    return '${diff.inSeconds} seconds ago';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes} minutes ago';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} hours ago';
  } else if (diff.inDays < 30) {
    return '${diff.inDays} days ago';
  } else if (diff.inDays < 365) {
    return '${(diff.inDays / 30).round()} months ago';
  } else {
    return '${(diff.inDays / 365).round()} years ago';
  }
}