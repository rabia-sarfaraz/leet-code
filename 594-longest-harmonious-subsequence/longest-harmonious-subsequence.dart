class Solution {
  int findLHS(List<int> nums) {
    Map<int, int> freq = {};

    for (int x in nums) {
      freq[x] = (freq[x] ?? 0) + 1;
    }

    int ans = 0;

    for (int x in freq.keys) {
      if (freq.containsKey(x + 1)) {
        ans = ans > (freq[x]! + freq[x + 1]!)
            ? ans
            : (freq[x]! + freq[x + 1]!);
      }
    }

    return ans;
  }
}