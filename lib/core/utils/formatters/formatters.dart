class BuzzWireFormatter {
  BuzzWireFormatter._();

  // contains function that handles formatting of output or input like date, numbers and the rest of them
  static String truncateText(String text, int maxLength) {
    if (text.length > maxLength) {
      return "${text.substring(0, maxLength)}...";
    } else {
      return text;
    }
  }
}
