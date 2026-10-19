
class Solution {
  List<int> targetIndices(List<int> nums, int target) {
    int smaller = 0;
    int count = 0;

    for (int num in nums) {
      if (num < target) {
        smaller++;
      } else if (num == target) {
        count++;
      }
    }

    List<int> result = [];

    for (int i = 0; i < count; i++) {
      result.add(smaller + i);
    }

    return result;
  }
}
