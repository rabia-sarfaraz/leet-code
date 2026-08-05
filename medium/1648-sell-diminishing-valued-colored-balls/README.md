# Sell Diminishing-Valued Colored Balls

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You have an inventory of different colored balls, and there is a customer that wants orders balls of any color.

The customer weirdly values the colored balls. Each colored ball's value is the number of balls of that color you currently have in your inventory. For example, if you own 6 yellow balls, the customer would pay 6 for the first yellow ball. After the transaction, there are only 5 yellow balls left, so the next yellow ball is then valued at 5 (i.e., the value of the balls decreases as you sell more to the customer).

You are given an integer array, inventory, where inventory[i] represents the number of balls of the ith color that you initially own. You are also given an integer orders, which represents the total number of balls that the customer wants. You can sell the balls in any order.

Return the maximum total value that you can attain after selling orders colored balls. As the answer may be too large, return it modulo 109 + 7.

 
Example 1:

Input: inventory = [2,5], orders = 4
Output: 14
Explanation: Sell the 1st color 1 time (2) and the 2nd color 3 times (5 + 4 + 3).
The maximum total value is 2 + 5 + 4 + 3 = 14.


Example 2:

Input: inventory = [3,5], orders = 6
Output: 19
Explanation: Sell the 1st color 2 times (3 + 2) and the 2nd color 4 times (5 + 4 + 3 + 2).
The maximum total value is 3 + 2 + 5 + 4 + 3 + 2 = 19.


 
Constraints:


	1 <= inventory.length <= 105
	1 <= inventory[i] <= 109
	1 <= orders <= min(sum(inventory[i]), 109)

## Solution

**Language:** dart  
**Runtime:** 98 ms (beats 100.00%)  
**Memory:** 168.6 MB (beats 100.00%)  
**Submitted:** 2026-08-05T11:49:57.788Z  

```dart
class Solution {
  static const int MOD = 1000000007;

  int maxProfit(List<int> inventory, int orders) {
    inventory.sort();

    int n = inventory.length;
    int i = n - 1;
    int colors = 1;
    int ans = 0;

    while (orders > 0) {
      int cur = inventory[i];
      int next = (i > 0) ? inventory[i - 1] : 0;

      int count = (cur - next) * colors;

      if (orders >= count) {
        ans = (ans +
                colors *
                    (((cur + next + 1) * (cur - next) ~/ 2) % MOD)) %
            MOD;
        orders -= count;
      } else {
        int full = orders ~/ colors;
        int rem = orders % colors;
        int low = cur - full;

        ans = (ans +
                colors *
                    (((cur + low + 1) * full ~/ 2) % MOD)) %
            MOD;

        ans = (ans + rem * low) % MOD;
        orders = 0;
      }

      i--;
      colors++;

      if (i < 0) break;
    }

    return ans % MOD;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/sell-diminishing-valued-colored-balls/)