class Solution {
  int countBalls(int lowLimit, int highLimit) {
    Map<int, int> boxes = {};
    int ans = 0;

    for (int num = lowLimit; num <= highLimit; num++) {
      int x = num;
      int sum = 0;

      // Digits ka sum
      while (x > 0) {
        sum += x % 10;
        x ~/= 10;
      }

      boxes[sum] = (boxes[sum] ?? 0) + 1;

      ans = ans > boxes[sum]! ? ans : boxes[sum]!;
    }

    return ans;
  }
}