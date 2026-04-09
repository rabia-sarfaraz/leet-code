class Solution {
  int numFriendRequests(List<int> ages) {
    List<int> count = List.filled(121, 0);

    for (int a in ages) {
      count[a]++;
    }

    int res = 0;

    for (int a = 1; a <= 120; a++) {
      if (count[a] == 0) continue;

      for (int b = 1; b <= 120; b++) {
        if (count[b] == 0) continue;

        if (b <= 0.5 * a + 7) continue;
        if (b > a) continue;

        res += count[a] * (a == b ? count[b] - 1 : count[b]);
      }
    }

    return res;
  }
}