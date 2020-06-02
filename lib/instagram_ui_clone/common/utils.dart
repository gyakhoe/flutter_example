class Utils {
  static String getTimeDifference(DateTime dateToCompare) {
    Duration difference = DateTime.now().difference(dateToCompare);
    int days = difference.inDays;
    if (days <= 1) {
      int secondsPast = difference.inSeconds;
      if (secondsPast < 60) {
        return '$secondsPast seconds ago.';
      } else {
        int minutesPast = difference.inMinutes;
        if (minutesPast >= 1 && minutesPast < 60) {
          return '$minutesPast minutes ago.';
        } else {
          return '${minutesPast % 60} hours ago';
        }
      }
    } else if (days >= 1 && days <= 7) {
      return '${difference.inDays} days ';
    } else if (days >= 7 && days <= 30) {
      return '${days % 7} weeks ago';
    } else {
      return '${days % 30} months ago';
    }
  }
}
