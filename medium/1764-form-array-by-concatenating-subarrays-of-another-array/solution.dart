class Solution {
  bool canChoose(List<List<int>> groups, List<int> nums) {
    int pos = 0;

    for (List<int> group in groups) {
      bool found = false;

      while (pos + group.length <= nums.length) {
        bool match = true;

        for (int j = 0; j < group.length; j++) {
          if (nums[pos + j] != group[j]) {
            match = false;
            break;
          }
        }

        if (match) {
          pos += group.length;
          found = true;
          break;
        }

        pos++;
      }

      if (!found) {
        return false;
      }
    }

    return true;
  }
}