# Number of Different Subsequences GCDs

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an array nums that consists of positive integers.

The GCD of a sequence of numbers is defined as the greatest integer that divides all the numbers in the sequence evenly.


	For example, the GCD of the sequence [4,6,16] is 2.


A subsequence of an array is a sequence that can be formed by removing some elements (possibly none) of the array.


	For example, [2,5,10] is a subsequence of [1,2,1,2,4,1,5,10].


Return the number of different GCDs among all non-empty subsequences of nums.

 
Example 1:

Input: nums = [6,10,3]
Output: 5
Explanation: The figure shows all the non-empty subsequences and their GCDs.
The different GCDs are 6, 10, 3, 2, and 1.


Example 2:

Input: nums = [5,15,40,5,6]
Output: 7


 
Constraints:


	1 <= nums.length <= 105
	1 <= nums[i] <= 2 * 105

## Solution

**Language:** dart  
**Runtime:** 133 ms (beats 100.00%)  
**Memory:** 225.5 MB (beats 100.00%)  
**Submitted:** 2026-08-29T03:31:07.391Z  

```dart
class Solution {
  int countDifferentSubsequenceGCDs(List<int> nums) {
    int maxVal = 0;

    for (int x in nums) {
      if (x > maxVal) {
        maxVal = x;
      }
    }

    // Check karta hai ke value nums mein actually present hai ya nahi
    List<bool> present = List.filled(maxVal + 1, false);

    for (int x in nums) {
      present[x] = true;
    }

    int answer = 0;

    for (int gcd = 1; gcd <= maxVal; gcd++) {
      int currentGcd = 0;

      // gcd ke multiples check karo
      for (int multiple = gcd; multiple <= maxVal; multiple += gcd) {
        if (present[multiple]) {
          currentGcd = _gcd(currentGcd, multiple);

          if (currentGcd == gcd) {
            answer++;
            break;
          }
        }
      }
    }

    return answer;
  }

  int _gcd(int a, int b) {
    while (b != 0) {
      int temp = a % b;
      a = b;
      b = temp;
    }

    return a;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/number-of-different-subsequences-gcds/)