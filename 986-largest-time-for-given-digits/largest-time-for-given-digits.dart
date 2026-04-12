class Solution {
  String largestTimeFromDigits(List<int> arr) {
    int maxTime = -1;

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (j == i) continue;
        for (int k = 0; k < 4; k++) {
          if (k == i || k == j) continue;
          
          int l = 6 - i - j - k; // remaining index

          int hour = arr[i] * 10 + arr[j];
          int minute = arr[k] * 10 + arr[l];

          if (hour < 24 && minute < 60) {
            int total = hour * 60 + minute;
            if (total > maxTime) {
              maxTime = total;
            }
          }
        }
      }
    }

    if (maxTime == -1) return "";

    int h = maxTime ~/ 60;
    int m = maxTime % 60;

    String hh = h < 10 ? "0$h" : "$h";
    String mm = m < 10 ? "0$m" : "$m";

    return "$hh:$mm";
  }
}