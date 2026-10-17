
class Solution {
  int digitSum(int num) {
    int sum = 0;

    while (num > 0) {
      sum += num % 10;
      num ~/= 10;
    }

    return sum;
  }

  int minSwaps(List<int> nums) {
    int n = nums.length;

    List<int> sorted = List.from(nums);

    sorted.sort((a, b) {
      int sumA = digitSum(a);
      int sumB = digitSum(b);

      if (sumA != sumB) {
        return sumA.compareTo(sumB);
      }

      return a.compareTo(b);
    });

    Map<int, int> targetIndex = {};

    for (int i = 0; i < n; i++) {
      targetIndex[sorted[i]] = i;
    }

    List<bool> visited = List.filled(n, false);
    int swaps = 0;

    for (int i = 0; i < n; i++) {
      if (visited[i]) continue;

      int current = i;
      int cycleSize = 0;

      while (!visited[current]) {
        visited[current] = true;
        current = targetIndex[nums[current]]!;
        cycleSize++;
      }

      if (cycleSize > 1) {
        swaps += cycleSize - 1;
      }
    }

    return swaps;
  }
}
