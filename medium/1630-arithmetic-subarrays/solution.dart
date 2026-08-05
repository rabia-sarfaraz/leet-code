class Solution {
  List<bool> checkArithmeticSubarrays(
      List<int> nums, List<int> l, List<int> r) {
    List<bool> ans = [];

    for (int i = 0; i < l.length; i++) {
      List<int> arr = nums.sublist(l[i], r[i] + 1);
      arr.sort();

      bool ok = true;
      int diff = arr[1] - arr[0];

      for (int j = 2; j < arr.length; j++) {
        if (arr[j] - arr[j - 1] != diff) {
          ok = false;
          break;
        }
      }

      ans.add(ok);
    }

    return ans;
  }
}