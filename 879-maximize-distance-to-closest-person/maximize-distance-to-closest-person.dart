class Solution {
  int maxDistToClosest(List<int> seats) {
    int n = seats.length;
    int last = -1;
    int ans = 0;

    for (int i = 0; i < n; i++) {
      if (seats[i] == 1) {
        if (last == -1) {
          // leading zeros
          ans = i;
        } else {
          // middle gap
          ans = ans > (i - last) ~/ 2 ? ans : (i - last) ~/ 2;
        }
        last = i;
      }
    }

    // trailing zeros
    ans = ans > (n - 1 - last) ? ans : (n - 1 - last);

    return ans;
  }
}