class Solution {
  int uniqueXorTriplets(List<int> nums) {
    const int MAX = 2048;

    List<bool> pair = List.filled(MAX, false);

    int n = nums.length;

    // All XORs of two elements (i <= j)
    for (int i = 0; i < n; i++) {
      for (int j = i; j < n; j++) {
        pair[nums[i] ^ nums[j]] = true;
      }
    }

    List<bool> ans = List.filled(MAX, false);

    // XOR with third element (k >= j not needed because values only matter)
    for (int x = 0; x < MAX; x++) {
      if (!pair[x]) continue;
      for (int v in nums) {
        ans[x ^ v] = true;
      }
    }

    int res = 0;
    for (bool ok in ans) {
      if (ok) res++;
    }
    return res;
  }
}