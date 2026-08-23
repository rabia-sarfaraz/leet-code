# Maximum Score of a Good Subarray

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an array of integers nums (0-indexed) and an integer k.

The score of a subarray (i, j) is defined as min(nums[i], nums[i+1], ..., nums[j]) * (j - i + 1). A good subarray is a subarray where i <= k <= j.

Return the maximum possible score of a good subarray.

 
Example 1:

Input: nums = [1,4,3,7,4,5], k = 3
Output: 15
Explanation: The optimal subarray is (1, 5) with a score of min(4,3,7,4,5) * (5-1+1) = 3 * 5 = 15. 


Example 2:

Input: nums = [5,5,4,5,4,1,1,1], k = 0
Output: 20
Explanation: The optimal subarray is (0, 4) with a score of min(5,5,4,5,4) * (4-0+1) = 4 * 5 = 20.


 
Constraints:


	1 <= nums.length <= 105
	1 <= nums[i] <= 2 * 104
	0 <= k < nums.length

## Solution

**Language:** dart  
**Runtime:** 3 ms (beats 100.00%)  
**Memory:** 189.7 MB (beats 100.00%)  
**Submitted:** 2026-08-23T05:38:01.957Z  

```dart
class Solution {
  int maximumScore(List<int> nums, int k) {
    int left = k;
    int right = k;
    int minVal = nums[k];
    int ans = nums[k];

    while (left > 0 || right < nums.length - 1) {
      if (left == 0) {
        right++;
      } else if (right == nums.length - 1) {
        left--;
      } else if (nums[left - 1] >= nums[right + 1]) {
        left--;
      } else {
        right++;
      }

      minVal = minVal < nums[left] ? minVal : nums[left];
      minVal = minVal < nums[right] ? minVal : nums[right];

      int score = minVal * (right - left + 1);

      if (score > ans) {
        ans = score;
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-score-of-a-good-subarray/)