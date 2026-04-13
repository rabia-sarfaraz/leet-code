class Solution {
  int subarraysDivByK(List<int> nums, int k) {
    Map<int, int> map = {};
    map[0] = 1; // important

    int sum = 0;
    int count = 0;

    for (int num in nums) {
      sum += num;

      int rem = sum % k;
      if (rem < 0) rem += k;

      if (map.containsKey(rem)) {
        count += map[rem]!;
      }

      map[rem] = (map[rem] ?? 0) + 1;
    }

    return count;
  }
}