class Solution {
  int longestConsecutive(List<int> nums) {
    if (nums.isEmpty) return 0;

    Set<int> set = nums.toSet();
    int longest = 0;

    for (int num in set) {
      // 🔥 only start of sequence
      if (!set.contains(num - 1)) {
        int current = num;
        int length = 1;

        while (set.contains(current + 1)) {
          current++;
          length++;
        }

        if (length > longest) {
          longest = length;
        }
      }
    }

    return longest;
  }
}