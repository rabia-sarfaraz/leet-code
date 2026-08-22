# Maximum Number of Events That Can Be Attended II

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an array of events where events[i] = [startDayi, endDayi, valuei]. The ith event starts at startDayi and ends at endDayi, and if you attend this event, you will receive a value of valuei. You are also given an integer k which represents the maximum number of events you can attend.

You can only attend one event at a time. If you choose to attend an event, you must attend the entire event. Note that the end day is inclusive: that is, you cannot attend two events where one of them starts and the other ends on the same day.

Return the maximum sum of values that you can receive by attending events.

 
Example 1:



Input: events = [[1,2,4],[3,4,3],[2,3,1]], k = 2
Output: 7
Explanation: Choose the green events, 0 and 1 (0-indexed) for a total value of 4 + 3 = 7.

Example 2:



Input: events = [[1,2,4],[3,4,3],[2,3,10]], k = 2
Output: 10
Explanation: Choose event 2 for a total value of 10.
Notice that you cannot attend any other event as they overlap, and that you do not have to attend k events.

Example 3:



Input: events = [[1,1,1],[2,2,2],[3,3,3],[4,4,4]], k = 3
Output: 9
Explanation: Although the events do not overlap, you can only attend 3 events. Pick the highest valued three.

 
Constraints:


	1 <= k <= events.length
	1 <= k * events.length <= 106
	1 <= startDayi <= endDayi <= 109
	1 <= valuei <= 106

## Solution

**Language:** dart  
**Runtime:** 114 ms (beats 100.00%)  
**Memory:** 275.7 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:56:32.613Z  

```dart
class Solution {
  int maxValue(List<List<int>> events, int k) {
    events.sort((a, b) => a[0].compareTo(b[0]));

    int n = events.length;

    // dp[i][j] = first i events mein se maximum value
    // using at most j events
    List<List<int>> dp =
        List.generate(n + 1, (_) => List.filled(k + 1, 0));

    // Har event ke baad next non-overlapping event find karo
    List<int> next = List.filled(n, n);

    for (int i = 0; i < n; i++) {
      int low = i + 1;
      int high = n;

      while (low < high) {
        int mid = (low + high) ~/ 2;

        if (events[mid][0] > events[i][1]) {
          high = mid;
        } else {
          low = mid + 1;
        }
      }

      next[i] = low;
    }

    for (int i = n - 1; i >= 0; i--) {
      for (int j = 1; j <= k; j++) {
        // Event skip karo
        dp[i][j] = dp[i + 1][j];

        // Event attend karo
        int take =
            events[i][2] + dp[next[i]][j - 1];

        if (take > dp[i][j]) {
          dp[i][j] = take;
        }
      }
    }

    return dp[0][k];
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended-ii/)