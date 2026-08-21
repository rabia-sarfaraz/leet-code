# Count Good Meals

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

A good meal is a meal that contains exactly two different food items with a sum of deliciousness equal to a power of two.

You can pick any two different foods to make a good meal.

Given an array of integers deliciousness where deliciousness[i] is the deliciousness of the i​​​​​​th​​​​​​​​ item of food, return the number of different good meals you can make from this list modulo 109 + 7.

Note that items with different indices are considered different even if they have the same deliciousness value.

 
Example 1:

Input: deliciousness = [1,3,5,7,9]
Output: 4
Explanation: The good meals are (1,3), (1,7), (3,5) and, (7,9).
Their respective sums are 4, 8, 8, and 16, all of which are powers of 2.


Example 2:

Input: deliciousness = [1,1,1,3,3,3,7]
Output: 15
Explanation: The good meals are (1,1) with 3 ways, (1,3) with 9 ways, and (1,7) with 3 ways.

 
Constraints:


	1 <= deliciousness.length <= 105
	0 <= deliciousness[i] <= 220

## Solution

**Language:** dart  
**Runtime:** 135 ms (beats 100.00%)  
**Memory:** 177.9 MB (beats 100.00%)  
**Submitted:** 2026-08-21T07:15:03.399Z  

```dart
class Solution {
  int countPairs(List<int> deliciousness) {
    const int MOD = 1000000007;

    Map<int, int> freq = {};
    int ans = 0;

    for (int x in deliciousness) {
      // Possible powers of 2
      for (int power = 1; power <= 1 << 21; power <<= 1) {
        int needed = power - x;

        if (freq.containsKey(needed)) {
          ans = (ans + freq[needed]!) % MOD;
        }
      }

      freq[x] = (freq[x] ?? 0) + 1;
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/count-good-meals/)