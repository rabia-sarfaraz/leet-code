class Solution {
  List<int> nextGreaterElements(List<int> nums) {
    int n = nums.length;
    List<int> res = List.filled(n, -1);
    List<int> stack = []; // store indices

    for (int i = 0; i < 2 * n; i++) {
      int num = nums[i % n];

      while (stack.isNotEmpty && nums[stack.last] < num) {
        int idx = stack.removeLast();
        res[idx] = num;
      }

      if (i < n) {
        stack.add(i);
      }
    }

    return res;
  }
}