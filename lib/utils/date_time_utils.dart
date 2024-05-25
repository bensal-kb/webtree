import 'package:intl/intl.dart';

///An util class for basic [DateTime] operations
class DateTimeUtils {
  static String getFormattedDateFromStr(String inputDate) {
    List<String> timeList = inputDate.split('-');
    DateTime dateTime = DateTime.now().copyWith(year: int.parse(timeList[0]), month: int.parse(timeList[1]), day: int.parse(timeList[2])).toLocal();
    String formattedDate = DateFormat('EEE').format(dateTime);
    return formattedDate;
  }

  static String getFormattedTimeFromStr(String inputTime) {
    List<String> timeList = inputTime.split(':');
    DateTime dateTime = DateTime.now()
        .copyWith(hour: int.parse(timeList[0]), minute: int.parse(timeList[1]))
        .toLocal();
    String formattedTime = DateFormat('h a').format(dateTime).toLowerCase();
    return formattedTime;
  }

}
