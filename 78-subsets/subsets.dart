class Solution {
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> result = [];

    void backtrack(int index, List<int> current) {
      // har step pe subset add karna hai
      result.add(List.from(current));

      for (int i = index; i < nums.length; i++) {
        current.add(nums[i]);            // choose
        backtrack(i + 1, current);      // explore
        current.removeLast();           // backtrack
      }
    }

    backtrack(0, []);
    return result;
  }
}