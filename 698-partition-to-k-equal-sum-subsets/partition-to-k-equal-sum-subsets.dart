class Solution {
  bool canPartitionKSubsets(List<int> nums, int k) {
    int sum = 0;
    for (int n in nums) sum += n;

    if (sum % k != 0) return false;

    int target = sum ~/ k;
    nums.sort((a, b) => b - a); // optimization

    List<bool> used = List.filled(nums.length, false);

    bool dfs(int start, int kLeft, int currSum) {
      if (kLeft == 1) return true;
      if (currSum == target) {
        return dfs(0, kLeft - 1, 0);
      }

      for (int i = start; i < nums.length; i++) {
        if (used[i]) continue;
        if (currSum + nums[i] > target) continue;

        used[i] = true;

        if (dfs(i + 1, kLeft, currSum + nums[i])) {
          return true;
        }

        used[i] = false;
      }

      return false;
    }

    return dfs(0, k, 0);
  }
}