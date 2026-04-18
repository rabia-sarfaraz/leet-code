class Solution {
  List<int> decompressRLElist(List<int> nums) {
    List<int> res = [];

    for (int i = 0; i < nums.length; i += 2) {
      int freq = nums[i];
      int val = nums[i + 1];

      for (int j = 0; j < freq; j++) {
        res.add(val);
      }
    }

    return res;
  }
}