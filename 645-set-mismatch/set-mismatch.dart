class Solution {
  List<int> findErrorNums(List<int> nums) {
    int n = nums.length;
    List<int> freq = List.filled(n + 1, 0);

    for (int num in nums) {
      freq[num]++;
    }

    int duplicate = -1;
    int missing = -1;

    for (int i = 1; i <= n; i++) {
      if (freq[i] == 2) {
        duplicate = i;
      } else if (freq[i] == 0) {
        missing = i;
      }
    }

    return [duplicate, missing];
  }
}