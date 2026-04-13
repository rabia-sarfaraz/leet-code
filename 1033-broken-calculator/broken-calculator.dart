class Solution {
  int brokenCalc(int startValue, int target) {
    int ops = 0;

    while (target > startValue) {
      ops++;

      if (target % 2 == 1) {
        target += 1; // reverse of -1 or helps make it even
      } else {
        target ~/= 2;
      }
    }

    return ops + (startValue - target);
  }
}