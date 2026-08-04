class Solution {
  List<int> findMissingElements(List<int> nums) {
    int mn = nums.reduce((a, b) => a < b ? a : b);
    int mx = nums.reduce((a, b) => a > b ? a : b);

    Set<int> seen = nums.toSet();
    List<int> ans = [];

    for (int i = mn; i <= mx; i++) {
      if (!seen.contains(i)) {
        ans.add(i);
      }
    }

    return ans;
  }
}