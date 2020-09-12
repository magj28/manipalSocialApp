String dateConvert(dateTimeData) {
  DateTime dateTime = DateTime.parse(dateTimeData).toLocal();
  int day = dateTime.day;
  int month = dateTime.month;
  int year = dateTime.year;
  return '$day/$month/$year ';
}

String timeConvert(dateTimeData) {
  print(dateTimeData);
  DateTime dateTime = DateTime.parse(dateTimeData).toLocal();
  int hrs = dateTime.hour;
  int min = dateTime.minute;
  return '$hrs:$min Hrs ';
}
