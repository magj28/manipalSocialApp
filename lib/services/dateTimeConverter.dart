String dateConvert(dateTimeData) {
  DateTime dateTime = DateTime.parse(dateTimeData).toLocal();
  int day = dateTime.day;
  int month = dateTime.month;
  int year = dateTime.year;
  return '$day/$month/$year ';
}

String timeConvert(dateTimeData) {
  DateTime dateTime = DateTime.parse(dateTimeData).toLocal();
  int hrs = dateTime.hour;
  int min = dateTime.minute;
  return '$hrs:$min Hrs ';
}

String dateAndTimeConvert(dateTimeData) {
  print(dateTimeData);
  DateTime dateTime = DateTime.parse(dateTimeData).toLocal();
  print(dateTime.toLocal());
  int hrs = dateTime.hour;
  int min = dateTime.minute;
  int day = dateTime.day;
  int month = dateTime.month;
  int year = dateTime.year;
  return '$day/$month/$year At $hrs:$min Hrs ';
}
