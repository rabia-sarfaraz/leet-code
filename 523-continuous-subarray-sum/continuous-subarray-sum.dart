class Solution {
  bool checkSubarraySum(List<int> nums, int k) {
    Map<int, int> map = {0: -1};

    int prefix = 0;

    for (int i = 0; i < nums.length; i++) {
      prefix += nums[i];

      int mod = k == 0 ? prefix : prefix % k;

      if (map.containsKey(mod)) {
        if (i - map[mod]! > 1) {
          return true;
        }
      } else {
        map[mod] = i;
      }
    }

    return false;
  }
}