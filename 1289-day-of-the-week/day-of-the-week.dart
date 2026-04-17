class Solution {
  String dayOfTheWeek(int day, int month, int year) {
    List<String> days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    DateTime date = DateTime(year, month, day);

    return days[date.weekday - 1];
  }
}