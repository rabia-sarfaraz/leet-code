class Solution {
  int sumFourDivisors(List<int> nums) {
    int totalSum = 0;

    for (int num in nums) {
      int count = 0;
      int sum = 0;

      for (int i = 1; i * i <= num; i++) {
        if (num % i == 0) {
          int d1 = i;
          int d2 = num ~/ i;

          if (d1 == d2) {
            count += 1;
            sum += d1;
          } else {
            count += 2;
            sum += d1 + d2;
          }
        }

        if (count > 4) break; // optimization
      }

      if (count == 4) {
        totalSum += sum;
      }
    }

    return totalSum;
  }
}