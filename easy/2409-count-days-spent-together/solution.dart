class Solution {
  int countDaysTogether(
      String arriveAlice,
      String leaveAlice,
      String arriveBob,
      String leaveBob) {

    List<int> daysInMonth = [
      31, 28, 31, 30, 31, 30,
      31, 31, 30, 31, 30, 31
    ];

    int toDays(String date) {
      int month = int.parse(date.substring(0, 2));
      int day = int.parse(date.substring(3, 5));

      int total = day;

      for (int i = 0; i < month - 1; i++) {
        total += daysInMonth[i];
      }

      return total;
    }

    int startAlice = toDays(arriveAlice);
    int endAlice = toDays(leaveAlice);
    int startBob = toDays(arriveBob);
    int endBob = toDays(leaveBob);

    int start = startAlice > startBob ? startAlice : startBob;
    int end = endAlice < endBob ? endAlice : endBob;

    return end >= start ? end - start + 1 : 0;
  }
}