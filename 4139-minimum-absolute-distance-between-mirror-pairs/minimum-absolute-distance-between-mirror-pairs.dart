class Solution {
  int reverseNum(int x) {
    int rev = 0;
    while (x > 0) {
      rev = rev * 10 + x % 10;
      x ~/= 10;
    }
    return rev;
  }

  int minMirrorPairDistance(List<int> nums) {
    Map<int, int> seen = {};
    int minDist = 1 << 30;

    for (int i = 0; i < nums.length; i++) {
      int rev = reverseNum(nums[i]);

      // direct match
      if (seen.containsKey(nums[i])) {
        int dist = i - seen[nums[i]]!;
        if (dist < minDist) {
          minDist = dist;
        }
      }

      // store reversed value
      seen[rev] = i;
    }

    return minDist == (1 << 30) ? -1 : minDist;
  }
}