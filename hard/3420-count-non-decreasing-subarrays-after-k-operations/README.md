# Count Non-Decreasing Subarrays After K Operations

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an array `nums` of `n` integers and an integer `k`.

For each subarray of `nums`, you can apply **up to** `k` operations on it. In each operation, you increment any element of the subarray by 1.

**Note** that each subarray is considered independently, meaning changes made to one subarray do not persist to another.

Return the number of subarrays that you can make **non-decreasing** ​​​​​after performing at most `k` operations.

An array is said to be **non-decreasing** if each element is greater than or equal to its previous element, if it exists.

 

Original
Dart
**Example 1:**

**Input:** nums = [6,3,1,2,4,4], k = 7

**Output:** 17

**Explanation:**

Out of all 21 possible subarrays of `nums`, only the subarrays `[6, 3, 1]`, `[6, 3, 1, 2]`, `[6, 3, 1, 2, 4]` and `[6, 3, 1, 2, 4, 4]` cannot be made non-decreasing after applying up to k = 7 operations. Thus, the number of non-decreasing subarrays is `21 - 4 = 17`.

**Example 2:**

**Input:** nums = [6,3,1,3,6], k = 4

**Output:** 12

**Explanation:**

The subarray `[3, 1, 3, 6]` along with all subarrays of `nums` with three or fewer elements, except `[6, 3, 1]`, can be made non-decreasing after `k` operations. There are 5 subarrays of a single element, 4 subarrays of two elements, and 2 subarrays of three elements except `[6, 3, 1]`, so there are `1 + 5 + 4 + 2 = 12` subarrays that can be made non-decreasing.

 

**Constraints:**

- 1 <= nums.length <= 105
- 1 <= nums[i] <= 109
- 1 <= k <= 109

## Solution

**Language:** dart  
**Runtime:** 53 ms (beats 100.00%)  
**Memory:** 208.4 MB (beats 100.00%)  
**Submitted:** 2026-11-13T08:50:50.935Z  

```dart

class Solution {
  int countNonDecreasingSubarrays(List<int> nums, int k) {
    int n = nums.length;

    List<int> values = List.filled(n, 0);
    List<int> counts = List.filled(n, 0);

    int head = 0;
    int tail = 0;

    int right = n - 1;
    int cost = 0;
    int ans = 0;

    for (int left = n - 1; left >= 0; left--) {
      int num = nums[left];
      int count = 1;

      while (tail > head && values[tail - 1] < num) {
        tail--;

        count += counts[tail];
        cost += (num - values[tail]) * counts[tail];
      }

      values[tail] = num;
      counts[tail] = count;
      tail++;

      while (cost > k) {
        int rightmostValue = values[head];

        cost -= rightmostValue - nums[right];
        right--;

        if (counts[head] > 1) {
          counts[head]--;
        } else {
          head++;
        }
      }

      ans += right - left + 1;
    }

    return ans;
  }
}

```

---

[View on LeetCode](https://leetcode.com/problems/count-non-decreasing-subarrays-after-k-operations/)