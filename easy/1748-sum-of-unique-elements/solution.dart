class Solution {
  int sumOfUnique(List<int> nums) {
    Map<int, int> freq = {};

    for (int num in nums) {
      freq[num] = (freq[num] ?? 0) + 1;
    }

    int sum = 0;

    for (int num in freq.keys) {
      if (freq[num] == 1) {
        sum += num;
      }
    }

    return sum;
  }
}