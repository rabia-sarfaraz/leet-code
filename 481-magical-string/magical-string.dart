class Solution {
  int magicalString(int n) {
    if (n <= 0) return 0;
    if (n <= 3) return 1;

    List<int> s = [1, 2, 2];
    int countOnes = 1;
    int i = 2;
    int nextNum = 1;

    while (s.length < n) {
      int times = s[i];

      for (int j = 0; j < times; j++) {
        s.add(nextNum);
        if (nextNum == 1 && s.length <= n) {
          countOnes++;
        }
      }

      nextNum = (nextNum == 1) ? 2 : 1;
      i++;
    }

    return countOnes;
  }
}