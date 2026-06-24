import 'package:flutter/foundation.dart';

enum LogFilter { all, bt, tree, ui, backend }

final _deviceLog = <LogFilter, bool>{
  LogFilter.all: false,
  LogFilter.bt: false,
  LogFilter.tree: false,
  LogFilter.ui: true,
  LogFilter.backend: true,
};

setLogEnabled(LogFilter log, bool onOff) => _deviceLog[log] = onOff;

isLogEnabled(LogFilter log) => _deviceLog[log];

dprint(message, {LogFilter filter = LogFilter.ui}) {
  if (_deviceLog[LogFilter.all] == false && _deviceLog[filter] == false) return;

  if (kDebugMode) {
    var a = StackTrace.current;
    final regexCodeLine = RegExp(r" (\(.*\))$");
    print(
        "[${filter.name}]$message${regexCodeLine.stringMatch(a.toString().split("\n")[1])}");
  }
}

longdprint(message, {LogFilter filter = LogFilter.ui}) {
  if (_deviceLog[LogFilter.all] == false && _deviceLog[filter] == false) return;

  if (kDebugMode) {
    var a = StackTrace.current;
    final regexCodeLine = RegExp(r" (\(.*\))$");
    debugPrint(
        "[${filter.name}]$message${regexCodeLine.stringMatch(a.toString().split("\n")[1])}",
        wrapWidth: 1000);
  }
}
