import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import 'capitalize_text.dart';

class DatesFormat {
  static String getMonthName({required int numberMonth}) {
    final Map<int, String> months = {
      1:'Enero',
      2:'Febrero',
      3:'Marzo',
      4:'Abril',
      5:'Mayo',
      6:'Junio',
      7:'Julio',
      8:'Agosto',
      9:'Septiembre',
      10:'Octubre',
      11:'Noviembre',
      12:'Diciembre',
    };
    return months[numberMonth] ?? 'Enero';
  }

  static String get lastDayMonth {
    final now = DateTime.now();

    DateTime beginningNextMonth = (now.month < 12)
        ? DateTime(now.year, now.month + 1, 1)
        : DateTime(now.year + 1, 1, 1);
    int lastDay = beginningNextMonth.subtract(const Duration(days: 1)).day;

    return '''Colombia, ${lastDay.toString()} de ${DatesFormat.getMonthName(numberMonth: DateTime.now().month)} del ${DateTime.now().year.toString()}''';
  }

  static DateTime convertStringToDateTime(String datetime) {
    return DateTime.parse(datetime);
  }

  static String formatDateSimpleText(DateTime dateTime) {
    return "${capitalize(DateFormat('EEEE', 'ES').format(dateTime))}, ${DatesFormat.formatDateToShortText(dateTime)}";
  }

  static String formatSimpleDayText(String day) {
    return DateFormat('EEEE', 'ES')
        .format(DatesFormat.convertStringToDateTime(day))
        .substring(0, 3)
        .toString()
        .toUpperCase();
  }

  static String formatDateFormalText(DateTime dateTime) =>
      DateFormat("'Colombia', d 'de' MMMM 'del' yyyy", 'es_CO')
          .format(dateTime);

  static String formatDateToShortText(DateTime dateTime) =>
      DateFormat("d 'de' MMMM yyyy", 'es_CO').format(dateTime);

  static String formatDateToTimeText(DateTime dateTime) =>
      DateFormat.jm().format(dateTime);

  static String get todayDateFormalText =>
      DateFormat("'Colombia', d 'de' MMMM 'del' yyyy", 'es_CO')
          .format(DateTime.now());

  static String convertDateValue(DateTime date) {
    return "${(date.day < 10) ? '0${date.day}' : (date.day)}.${(date.month < 10) ? '0${date.month}' : (date.month)}.${date.year}";
  }

  static String convertMilisecondsToDate(String time) {
    final newDate = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return convertDateValue(newDate);
  }

  static Future<void> setLocaleOfDate({
    required BuildContext context,
    required String localeName,
  }) async {
    await Jiffy.locale(localeName);
  }

  static String formaFromAgoDate(String date) => Jiffy(date).fromNow();
}
