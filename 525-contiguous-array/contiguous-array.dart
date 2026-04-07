class Solution {
  int findMaxLength(List<int> nums) {
    Map<int, int> map = {0: -1};

    int prefix = 0;
    int result = 0;

    for (int i = 0; i < nums.length; i++) {
      prefix += (nums[i] == 0) ? -1 : 1;

      if (map.containsKey(prefix)) {
        result = result > (i - map[prefix]!)
            ? result
            : (i - map[prefix]!);
      } else {
        map[prefix] = i;
      }
    }

    return result;
  }
}