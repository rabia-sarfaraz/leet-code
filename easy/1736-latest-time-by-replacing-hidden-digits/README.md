# Latest Time by Replacing Hidden Digits

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

You are given a string time in the form of  hh:mm, where some of the digits in the string are hidden (represented by ?).

The valid times are those inclusively between 00:00 and 23:59.

Return the latest valid time you can get from time by replacing the hidden digits.

 
Example 1:

Input: time = "2?:?0"
Output: "23:50"
Explanation: The latest hour beginning with the digit '2' is 23 and the latest minute ending with the digit '0' is 50.


Example 2:

Input: time = "0?:3?"
Output: "09:39"


Example 3:

Input: time = "1?:22"
Output: "19:22"


 
Constraints:


	time is in the format hh:mm.
	It is guaranteed that you can produce a valid time from the given string.

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 100.00%)  
**Memory:** 154.3 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:47:45.744Z  

```dart
class Solution {
  String maximumTime(String time) {
    List<String> t = time.split('');

    // Hour
    if (t[0] == '?') {
      t[0] = (t[1] == '?' || int.parse(t[1]) <= 3) ? '2' : '1';
    }

    if (t[1] == '?') {
      t[1] = (t[0] == '2') ? '3' : '9';
    }

    // Minutes
    if (t[3] == '?') {
      t[3] = '5';
    }

    if (t[4] == '?') {
      t[4] = '9';
    }

    return t.join('');
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/latest-time-by-replacing-hidden-digits/)