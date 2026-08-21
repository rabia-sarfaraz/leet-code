class Solution {
  int minMoves(List<int> nums, int k) {
    List<int> pos = [];

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 1) {
        pos.add(i);
      }
    }

    if (k == 1) return 0;

    // Adjust positions so that consecutive ones can be centered
    List<int> adjusted = [];

    for (int i = 0; i < pos.length; i++) {
      adjusted.add(pos[i] - i);
    }

    // Prefix sum
    List<int> prefix = List.filled(adjusted.length + 1, 0);

    for (int i = 0; i < adjusted.length; i++) {
      prefix[i + 1] = prefix[i] + adjusted[i];
    }

    int ans = 1 << 60;

    for (int i = 0; i + k <= adjusted.length; i++) {
      int mid = i + k ~/ 2;
      int median = adjusted[mid];

      int leftCount = mid - i;
      int rightCount = i + k - mid - 1;

      int leftSum = prefix[mid] - prefix[i];
      int rightSum = prefix[i + k] - prefix[mid + 1];

      int cost =
          median * leftCount - leftSum +
          rightSum - median * rightCount;

      ans = ans < cost ? ans : cost;
    }

    return ans;
  }
}