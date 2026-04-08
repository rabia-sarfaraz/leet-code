class Solution {
  int subarraySum(List<int> nums, int k) {
    Map<int, int> count = {};
    count[0] = 1;

    int prefixSum = 0;
    int result = 0;

    for (int num in nums) {
      prefixSum += num;

      if (count.containsKey(prefixSum - k)) {
        result += count[prefixSum - k]!;
      }

      count[prefixSum] = (count[prefixSum] ?? 0) + 1;
    }

    return result;
  }
}