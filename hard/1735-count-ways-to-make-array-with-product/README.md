# Count Ways to Make Array With Product

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given a 2D integer array, queries. For each queries[i], where queries[i] = [ni, ki], find the number of different ways you can place positive integers into an array of size ni such that the product of the integers is ki. As the number of ways may be too large, the answer to the ith query is the number of ways modulo 109 + 7.

Return an integer array answer where answer.length == queries.length, and answer[i] is the answer to the ith query.

 
Example 1:

Input: queries = [[2,6],[5,1],[73,660]]
Output: [4,1,50734910]
Explanation: Each query is independent.
[2,6]: There are 4 ways to fill an array of size 2 that multiply to 6: [1,6], [2,3], [3,2], [6,1].
[5,1]: There is 1 way to fill an array of size 5 that multiply to 1: [1,1,1,1,1].
[73,660]: There are 1050734917 ways to fill an array of size 73 that multiply to 660. 1050734917 modulo 109 + 7 = 50734910.


Example 2:

Input: queries = [[1,1],[2,2],[3,3],[4,4],[5,5]]
Output: [1,2,3,10,5]


 
Constraints:


	1 <= queries.length <= 104 
	1 <= ni, ki <= 104

## Solution

**Language:** dart  
**Runtime:** 32 ms (beats 100.00%)  
**Memory:** 160.4 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:46:45.022Z  

```dart
class Solution {
  static const int MOD = 1000000007;

  List<int> waysToFillArray(List<List<int>> queries) {
    int maxN = 10000;
    int maxK = 15;

    // factorial
    List<int> fact = List.filled(maxN + maxK + 1, 1);

    for (int i = 1; i < fact.length; i++) {
      fact[i] = (fact[i - 1] * i) % MOD;
    }

    // Modular inverse
    int modPow(int a, int b) {
      int result = 1;

      while (b > 0) {
        if (b % 2 == 1) {
          result = (result * a) % MOD;
        }

        a = (a * a) % MOD;
        b ~/= 2;
      }

      return result;
    }

    int combination(int n, int r) {
      if (r < 0 || r > n) return 0;

      int numerator = fact[n];
      int denominator =
          (fact[r] * fact[n - r]) % MOD;

      return (numerator * modPow(denominator, MOD - 2)) % MOD;
    }

    List<int> answer = [];

    for (var query in queries) {
      int n = query[0];
      int k = query[1];

      int x = k;
      int ways = 1;

      // Prime factorization
      for (int p = 2; p * p <= x; p++) {
        if (x % p == 0) {
          int count = 0;

          while (x % p == 0) {
            x ~/= p;
            count++;
          }

          // stars and bars:
          // C(n + count - 1, count)
          ways = (ways * combination(n + count - 1, count)) % MOD;
        }
      }

      // Remaining prime factor
      if (x > 1) {
        ways = (ways * n) % MOD;
      }

      answer.add(ways);
    }

    return answer;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/count-ways-to-make-array-with-product/)