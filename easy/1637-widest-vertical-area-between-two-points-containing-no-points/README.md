# Widest Vertical Area Between Two Points Containing No Points

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

Given n points on a 2D plane where points[i] = [xi, yi], Return the widest vertical area between two points such that no points are inside the area.

A vertical area is an area of fixed-width extending infinitely along the y-axis (i.e., infinite height). The widest vertical area is the one with the maximum width.

Note that points on the edge of a vertical area are not considered included in the area.

 
Example 1:
​
Input: points = [[8,7],[9,9],[7,4],[9,7]]
Output: 1
Explanation: Both the red and the blue area are optimal.


Example 2:

Input: points = [[3,1],[9,0],[1,0],[1,4],[5,3],[8,8]]
Output: 3


 
Constraints:


	n == points.length
	2 <= n <= 105
	points[i].length == 2
	0 <= xi, yi <= 109

## Solution

**Language:** dart  
**Runtime:** 64 ms (beats 60.00%)  
**Memory:** 185.3 MB (beats 40.00%)  
**Submitted:** 2026-08-05T11:34:13.665Z  

```dart
class Solution {
  int maxWidthOfVerticalArea(List<List<int>> points) {
    List<int> xs = [];

    for (var point in points) {
      xs.add(point[0]);
    }

    xs.sort();

    int ans = 0;
    for (int i = 1; i < xs.length; i++) {
      ans = ans > (xs[i] - xs[i - 1]) ? ans : (xs[i] - xs[i - 1]);
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/widest-vertical-area-between-two-points-containing-no-points/)