class Solution {
  int numSubarraysWithSum(List<int> nums, int goal) {
    Map<int, int> freq = {0: 1};

    int prefixSum = 0;
    int count = 0;

    for (int num in nums) {
      prefixSum += num;

      if (freq.containsKey(prefixSum - goal)) {
        count += freq[prefixSum - goal]!;
      }

      freq[prefixSum] = (freq[prefixSum] ?? 0) + 1;
    }

    return count;
  }
}