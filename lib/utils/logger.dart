enum Level {
  verbose,
  debug,
  info,
  warning,
  error,
  nothing,
}

class Logger {
  /// The current logging level of the app.
  ///
  /// All logs with levels below this level will be omitted.
  static Level level = Level.verbose;

  factory Logger() {
    return _singleton;
  }

  static final Logger _singleton = Logger._internal();

  Logger._internal() {
    print("Instance created Logger");
  }

  /// Log message at level [Level.verbose].
  void v(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.verbose, message, error, stackTrace);
  }

  /// Log message at level [Level.debug].
  void d(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.debug, message, error, stackTrace);
  }

  /// Log message at level [Level.info].
  void i(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.info, message, error, stackTrace);
  }

  /// Log message at level [Level.warning].
  void w(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.warning, message, error, stackTrace);
  }

  /// Log message at level [Level.error].
  void e(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.error, message, error, stackTrace);
  }

  /// Log message with [level].
  void log(Level level, dynamic message,
      [dynamic error, StackTrace stackTrace]) {
    assert(error == null || !(error is StackTrace),
        "Error parameter cannot take a StackTrace!");
    if (this._shouldLog(level)) {
      //print("├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄");
      print("├ ${this._getEmojiFromLevel(level)} ${message.toString()}");
      //print("├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄");
    }
  }

  bool _shouldLog(Level level) {
    return Logger._getLevelToInt(Logger.level) <= Logger._getLevelToInt(level);
  }

  static int _getLevelToInt(Level level) {
    if (level == Level.verbose) {
      return 1;
    } else if (level == Level.verbose) {
      return 1;
    } else if (level == Level.debug) {
      return 2;
    } else if (level == Level.info) {
      return 3;
    } else if (level == Level.warning) {
      return 4;
    } else if (level == Level.error) {
      return 5;
    } else if (level == Level.nothing) {
      return 6;
    }
    return -1;
  }

  String _getEmojiFromLevel(Level level) {
    if (level == Level.verbose) {
      return "💣💥";
    } else if (level == Level.debug) {
      return "🔬";
    } else if (level == Level.info) {
      return "💡";
    } else if (level == Level.warning) {
      return "⚠️";
    } else if (level == Level.error) {
      return "🚨";
    } else if (level == Level.nothing) {
      return "";
    }
    return "";
  }
}
