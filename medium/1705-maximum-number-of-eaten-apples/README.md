# Maximum Number of Eaten Apples

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

There is a special kind of apple tree that grows apples every day for n days. On the ith day, the tree grows apples[i] apples that will rot after days[i] days, that is on day i + days[i] the apples will be rotten and cannot be eaten. On some days, the apple tree does not grow any apples, which are denoted by apples[i] == 0 and days[i] == 0.

You decided to eat at most one apple a day (to keep the doctors away). Note that you can keep eating after the first n days.

Given two integer arrays days and apples of length n, return the maximum number of apples you can eat.

 
Example 1:

Input: apples = [1,2,3,5,2], days = [3,2,1,4,2]
Output: 7
Explanation: You can eat 7 apples:
- On the first day, you eat an apple that grew on the first day.
- On the second day, you eat an apple that grew on the second day.
- On the third day, you eat an apple that grew on the second day. After this day, the apples that grew on the third day rot.
- On the fourth to the seventh days, you eat apples that grew on the fourth day.


Example 2:

Input: apples = [3,0,0,0,0,2], days = [3,0,0,0,0,2]
Output: 5
Explanation: You can eat 5 apples:
- On the first to the third day you eat apples that grew on the first day.
- Do nothing on the fouth and fifth days.
- On the sixth and seventh days you eat apples that grew on the sixth day.


 
Constraints:


	n == apples.length == days.length
	1 <= n <= 2 * 104
	0 <= apples[i], days[i] <= 2 * 104
	days[i] = 0 if and only if apples[i] = 0.

## Solution

**Language:** dart  
**Runtime:** 89 ms (beats 100.00%)  
**Memory:** 163.2 MB (beats 100.00%)  
**Submitted:** 2026-08-21T07:12:18.433Z  

```dart
import 'dart:collection';

class Solution {
  int eatenApples(List<int> apples, List<int> days) {
    // [expiryDay, numberOfApples]
    Heap heap = Heap();

    int eaten = 0;
    int day = 0;

    while (day < apples.length || heap.isNotEmpty) {
      // Aaj ke apples add karo
      if (day < apples.length && apples[day] > 0) {
        heap.add([
          day + days[day],
          apples[day]
        ]);
      }

      // Expired apples remove karo
      while (heap.isNotEmpty && heap.peek()[0] <= day) {
        heap.remove();
      }

      // Sabse pehle expire hone wala batch khao
      if (heap.isNotEmpty) {
        var current = heap.remove();

        eaten++;

        if (current[1] > 1) {
          heap.add([
            current[0],
            current[1] - 1
          ]);
        }
      }

      day++;
    }

    return eaten;
  }
}

class Heap {
  final List<List<int>> _heap = [];

  bool get isNotEmpty => _heap.isNotEmpty;

  void add(List<int> value) {
    _heap.add(value);
    int i = _heap.length - 1;

    while (i > 0) {
      int parent = (i - 1) ~/ 2;

      if (_heap[parent][0] <= _heap[i][0]) break;

      var temp = _heap[parent];
      _heap[parent] = _heap[i];
      _heap[i] = temp;

      i = parent;
    }
  }

  List<int> peek() => _heap[0];

  List<int> remove() {
    var result = _heap[0];
    var last = _heap.removeLast();

    if (_heap.isNotEmpty) {
      _heap[0] = last;

      int i = 0;

      while (true) {
        int left = i * 2 + 1;
        int right = i * 2 + 2;
        int smallest = i;

        if (left < _heap.length &&
            _heap[left][0] < _heap[smallest][0]) {
          smallest = left;
        }

        if (right < _heap.length &&
            _heap[right][0] < _heap[smallest][0]) {
          smallest = right;
        }

        if (smallest == i) break;

        var temp = _heap[i];
        _heap[i] = _heap[smallest];
        _heap[smallest] = temp;

        i = smallest;
      }
    }

    return result;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-number-of-eaten-apples/)