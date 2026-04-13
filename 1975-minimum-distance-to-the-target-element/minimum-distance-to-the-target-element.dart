class Solution {
  int getMinDistance(List<int> nums, int target, int start) {
    int n = nums.length;
    int ans = n; // large value

    // check left and right
    for (int i = 0; i < n; i++) {
      if (nums[i] == target) {
        int dist = (i - start).abs();
        if (dist < ans) {
          ans = dist;
        }
      }
    }

    return ans;
  }
}