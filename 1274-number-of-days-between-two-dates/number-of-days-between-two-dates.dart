class Solution {
  int daysBetweenDates(String date1, String date2) {
    DateTime d1 = DateTime.parse(date1);
    DateTime d2 = DateTime.parse(date2);

    return d1.difference(d2).inDays.abs();
  }
}