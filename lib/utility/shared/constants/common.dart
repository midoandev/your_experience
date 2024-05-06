import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';


class CommonConstants {
  static const String test = 'test';
  static const num testNum = 1;
  static const double largeText = 40.0;
  static const double normalText = 22.0;
  static const double smallText = 16.0;

  static FontWeight light = FontWeight.w300;
  static FontWeight medium = FontWeight.w400;
  static FontWeight regular = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
}

double pxToDouble({required double px}) {
  return 0.08333333 * px;
}

String getRandomNumber() {
  Random random = Random();
  int randomNumber = random.nextInt(10000000);
  int lngt = randomNumber.toString().length;
  String myNumber = randomNumber.toString().substring(0, lngt > 5 ? 5 : lngt);
  return myNumber;
}

bool isJsonString(value) {
  try {
    jsonDecode(value);
  } catch (e) {
    return false;
  }
  return true;
}

bool isList(value) {
  return value is List;
}

bool isNotNull(value) {
  return value != null;
}

class CustonDebounce {
  final int second;
  Timer? _timer;

  CustonDebounce({required this.second});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: second), action);
  }
}

Map<String, bool> checkDate(DateTime date) {
  DateTime now = DateTime.now();
  bool monthSame = date.month == now.month;
  bool yearSame = date.year == now.year;
  int daySame = now.day - date.day;
  bool weekSame = date.day >= now.day - 7 && now.day - 7 <= now.day;
  // Get.log('month ${now.month} -- ${date.month} == $monthSame and year $yearSame' );
  var obj = {
    'just': monthSame &&
        yearSame &&
        daySame == 0 &&
        now.hour == date.hour &&
        now.minute == date.minute,
    'yesterday': monthSame && yearSame && daySame == 1,
    'today': monthSame && yearSame && daySame == 0,
    'week': monthSame && yearSame && weekSame,
    'month': monthSame
  };

  return obj;
}

