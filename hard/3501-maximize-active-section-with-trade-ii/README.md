# Maximize Active Section with Trade II

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given a binary string s of length n, where:


	'1' represents an active section.
	'0' represents an inactive section.


You can perform at most one trade to maximize the number of active sections in s. In a trade, you:


	Convert a contiguous block of '1's that is surrounded by '0's to all '0's.
	Afterward, convert a contiguous block of '0's that is surrounded by '1's to all '1's.


Additionally, you are given a 2D array queries, where queries[i] = [li, ri] represents a substring s[li...ri].

For each query, determine the maximum possible number of active sections in s after making the optimal trade on the substring s[li...ri].

Return an array answer, where answer[i] is the result for queries[i].

Note


	For each query, treat s[li...ri] as if it is augmented with a '1' at both ends, forming t = '1' + s[li...ri] + '1'. The augmented '1's do not contribute to the final count.
	The queries are independent of each other.


 
Example 1:


Input: s = "01", queries = [[0,1]]

Output: [1]

Explanation:

Because there is no block of '1's surrounded by '0's, no valid trade is possible. The maximum number of active sections is 1.


Example 2:


Input: s = "0100", queries = [[0,3],[0,2],[1,3],[2,3]]

Output: [4,3,1,1]

Explanation:


	
	Query [0, 3] → Substring "0100" → Augmented to "101001"
	Choose "0100", convert "0100" → "0000" → "1111".
	The final string without augmentation is "1111". The maximum number of active sections is 4.
	
	
	Query [0, 2] → Substring "010" → Augmented to "10101"
	Choose "010", convert "010" → "000" → "111".
	The final string without augmentation is "1110". The maximum number of active sections is 3.
	
	
	Query [1, 3] → Substring "100" → Augmented to "11001"
	Because there is no block of '1's surrounded by '0's, no valid trade is possible. The maximum number of active sections is 1.
	
	
	Query [2, 3] → Substring "00" → Augmented to "1001"
	Because there is no block of '1's surrounded by '0's, no valid trade is possible. The maximum number of active sections is 1.
	



Example 3:


Input: s = "1000100", queries = [[1,5],[0,6],[0,4]]

Output: [6,7,2]

Explanation:


	
	Query [1, 5] → Substring "00010" → Augmented to "1000101"
	Choose "00010", convert "00010" → "00000" → "11111".
	The final string without augmentation is "1111110". The maximum number of active sections is 6.
	
	
	Query [0, 6] → Substring "1000100" → Augmented to "110001001"
	Choose "000100", convert "000100" → "000000" → "111111".
	The final string without augmentation is "1111111". The maximum number of active sections is 7.
	
	
	Query [0, 4] → Substring "10001" → Augmented to "1100011"
	Because there is no block of '1's surrounded by '0's, no valid trade is possible. The maximum number of active sections is 2.
	



Example 4:


Input: s = "01010", queries = [[0,3],[1,4],[1,3]]

Output: [4,4,2]

Explanation:


	
	Query [0, 3] → Substring "0101" → Augmented to "101011"
	Choose "010", convert "010" → "000" → "111".
	The final string without augmentation is "11110". The maximum number of active sections is 4.
	
	
	Query [1, 4] → Substring "1010" → Augmented to "110101"
	Choose "010", convert "010" → "000" → "111".
	The final string without augmentation is "01111". The maximum number of active sections is 4.
	
	
	Query [1, 3] → Substring "101" → Augmented to "11011"
	Because there is no block of '1's surrounded by '0's, no valid trade is possible. The maximum number of active sections is 2.
	



 
Constraints:


	1 <= n == s.length <= 105
	1 <= queries.length <= 105
	s[i] is either '0' or '1'.
	queries[i] = [li, ri]
	0 <= li <= ri < n

## Solution

**Language:** dart  
**Runtime:** 149 ms (beats 100.00%)  
**Memory:** 324.2 MB (beats 100.00%)  
**Submitted:** 2026-07-22T06:23:18.666Z  

```dart
class Solution {
  int _mx(int a, int b) => a > b ? a : b;
  int _mn(int a, int b) => a < b ? a : b;

  List<int> maxActiveSectionsAfterTrade(String s, List<List<int>> queries) {
    final n = s.length;

    int totalOnes = 0;
    for (int i = 0; i < n; i++) {
      if (s.codeUnitAt(i) == 49) totalOnes++;
    }

    // zero blocks
    final st = <int>[];
    final en = <int>[];
    int i = 0;
    while (i < n) {
      if (s.codeUnitAt(i) == 48) {
        int j = i;
        while (j < n && s.codeUnitAt(j) == 48) j++;
        st.add(i);
        en.add(j - 1);
        i = j;
      } else {
        i++;
      }
    }

    final m = st.length;
    final ans = List<int>.filled(queries.length, totalOnes);
    if (m < 2) return ans;

    // sparse table on adjacent-pair sums
    final P = m - 1;
    int LOG = 1;
    while ((1 << LOG) <= P) LOG++;
    final sp = List.generate(LOG, (_) => List<int>.filled(P, 0));
    for (int k = 0; k < P; k++) {
      sp[0][k] = (en[k] - st[k] + 1) + (en[k + 1] - st[k + 1] + 1);
    }
    for (int j = 1; j < LOG; j++) {
      for (int k = 0; k + (1 << j) <= P; k++) {
        sp[j][k] = _mx(sp[j - 1][k], sp[j - 1][k + (1 << (j - 1))]);
      }
    }

    int queryMax(int l, int r) {
      if (l < 0) l = 0;
      if (r > P - 1) r = P - 1;
      if (l > r) return 0;
      int j = 0;
      while ((1 << (j + 1)) <= r - l + 1) j++;
      return _mx(sp[j][l], sp[j][r - (1 << j) + 1]);
    }

    for (int q = 0; q < queries.length; q++) {
      final L = queries[q][0];
      final R = queries[q][1];

      // first zero-block with en >= L
      int lo = 0, hi = m - 1, first = m;
      while (lo <= hi) {
        final mid = (lo + hi) >> 1;
        if (en[mid] >= L) {
          first = mid;
          hi = mid - 1;
        } else {
          lo = mid + 1;
        }
      }
      // last zero-block with st <= R
      lo = 0;
      hi = m - 1;
      int last = -1;
      while (lo <= hi) {
        final mid = (lo + hi) >> 1;
        if (st[mid] <= R) {
          last = mid;
          lo = mid + 1;
        } else {
          hi = mid - 1;
        }
      }

      if (first >= m || last < 0 || last <= first) continue;

      final firstLen = _mn(en[first], R) - _mx(st[first], L) + 1;
      final lastLen = _mn(en[last], R) - _mx(st[last], L) + 1;

      int best = 0;

      // interior pairs: both blocks fully inside
      if (last - 2 >= first + 1) {
        best = _mx(best, queryMax(first + 1, last - 2));
      }

      // pair (first, first+1)
      final nxtLen = (first + 1 == last)
          ? lastLen
          : (en[first + 1] - st[first + 1] + 1);
      best = _mx(best, firstLen + nxtLen);

      // pair (last-1, last)
      final prvLen = (last - 1 == first)
          ? firstLen
          : (en[last - 1] - st[last - 1] + 1);
      best = _mx(best, prvLen + lastLen);

      ans[q] = totalOnes + best;
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximize-active-section-with-trade-ii/)