class Solution {
  List<int> sumEvenAfterQueries(List<int> nums, List<List<int>> queries) {
    int evenSum = 0;

    // initial even sum
    for (int x in nums) {
      if (x % 2 == 0) evenSum += x;
    }

    List<int> result = [];

    for (var q in queries) {
      int val = q[0];
      int idx = q[1];

      // remove old value if even
      if (nums[idx] % 2 == 0) {
        evenSum -= nums[idx];
      }

      // update value
      nums[idx] += val;

      // add new value if even
      if (nums[idx] % 2 == 0) {
        evenSum += nums[idx];
      }

      result.add(evenSum);
    }

    return result;
  }
}