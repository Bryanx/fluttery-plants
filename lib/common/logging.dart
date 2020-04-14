import 'package:logger/logger.dart';

final log = getLogger();

Logger getLogger() {
  return Logger(printer: PrettyPrinter(methodCount: 1));
}

String logState(Object prevState, Object nextState) {
  return "Previous state: $prevState\n" +
      "Next state: $nextState";
}