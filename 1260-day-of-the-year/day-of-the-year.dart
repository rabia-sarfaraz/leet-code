class Solution {
  int dayOfYear(String date) {
    List<int> daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    int year = int.parse(date.substring(0, 4));
    int month = int.parse(date.substring(5, 7));
    int day = int.parse(date.substring(8, 10));

    bool isLeap = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

    if (isLeap) {
      daysInMonth[1] = 29;
    }

    int result = 0;

    for (int i = 0; i < month - 1; i++) {
      result += daysInMonth[i];
    }

    result += day;

    return result;
  }
}