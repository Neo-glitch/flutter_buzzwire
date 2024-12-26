import 'package:intl/intl.dart';

class BuzzWireDateHelperFunctions {
  BuzzWireDateHelperFunctions._();

  static String formatTimeAgo(String dateString) {
    if (dateString.isEmpty) return "";

    DateTime parsedDate = DateTime.parse(dateString).toLocal();
    DateTime now = DateTime.now();
    Duration difference = now.difference(parsedDate);

    if (difference.inSeconds < 60) {
      return "Just now";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} mins ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else if (difference.inDays == 1) {
      return "Yesterday";
    } else {
      return DateFormat('MMMM d, yyyy')
          .format(parsedDate); // e.g., February 18, 2024
    }
  }
}
