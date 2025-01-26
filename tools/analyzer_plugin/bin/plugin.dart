import 'dart:isolate';

import 'package:mobius_custom_linter_report/mobius_custom_linter_report.dart';

void main(List<String> args, SendPort sendPort) {
  start(args, sendPort);
}
