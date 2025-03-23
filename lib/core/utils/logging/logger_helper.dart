// import 'package:logg'

import 'package:logger/logger.dart';

class BuzzWireLoggerHelper {
  BuzzWireLoggerHelper._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    // customize log level base on needs
    level: Level.debug,
  );

  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message) {
    _logger.e(message);
  }
}
