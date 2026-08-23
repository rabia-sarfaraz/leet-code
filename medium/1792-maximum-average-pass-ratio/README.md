# Maximum Average Pass Ratio

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

There is a school that has classes of students and each class will be having a final exam. You are given a 2D integer array classes, where classes[i] = [passi, totali]. You know beforehand that in the ith class, there are totali total students, but only passi number of students will pass the exam.

You are also given an integer extraStudents. There are another extraStudents brilliant students that are guaranteed to pass the exam of any class they are assigned to. You want to assign each of the extraStudents students to a class in a way that maximizes the average pass ratio across all the classes.

The pass ratio of a class is equal to the number of students of the class that will pass the exam divided by the total number of students of the class. The average pass ratio is the sum of pass ratios of all the classes divided by the number of the classes.

Return the maximum possible average pass ratio after assigning the extraStudents students. Answers within 10-5 of the actual answer will be accepted.

 
Example 1:

Input: classes = [[1,2],[3,5],[2,2]], extraStudents = 2
Output: 0.78333
Explanation: You can assign the two extra students to the first class. The average pass ratio will be equal to (3/4 + 3/5 + 2/2) / 3 = 0.78333.


Example 2:

Input: classes = [[2,4],[3,9],[4,5],[2,10]], extraStudents = 4
Output: 0.53485


 
Constraints:


	1 <= classes.length <= 105
	classes[i].length == 2
	1 <= passi <= totali <= 105
	1 <= extraStudents <= 105

## Solution

**Language:** dart  
**Runtime:** 355 ms (beats 100.00%)  
**Memory:** 243.7 MB (beats 100.00%)  
**Submitted:** 2026-08-23T05:37:32.607Z  

```dart
class Solution {
  double maxAverageRatio(List<List<int>> classes, int extraStudents) {
    List<List<dynamic>> heap = [];

    double gain(int pass, int total) {
      return (pass + 1) / (total + 1) - pass / total;
    }

    void push(List<dynamic> item) {
      heap.add(item);
      int i = heap.length - 1;

      while (i > 0) {
        int parent = (i - 1) ~/ 2;

        if (heap[parent][0] >= heap[i][0]) break;

        var temp = heap[parent];
        heap[parent] = heap[i];
        heap[i] = temp;

        i = parent;
      }
    }

    List<dynamic> pop() {
      var result = heap[0];
      var last = heap.removeLast();

      if (heap.isNotEmpty) {
        heap[0] = last;
        int i = 0;

        while (true) {
          int left = i * 2 + 1;
          int right = i * 2 + 2;
          int largest = i;

          if (left < heap.length &&
              heap[left][0] > heap[largest][0]) {
            largest = left;
          }

          if (right < heap.length &&
              heap[right][0] > heap[largest][0]) {
            largest = right;
          }

          if (largest == i) break;

          var temp = heap[i];
          heap[i] = heap[largest];
          heap[largest] = temp;

          i = largest;
        }
      }

      return result;
    }

    // Build max heap
    for (var c in classes) {
      int pass = c[0];
      int total = c[1];

      push([gain(pass, total), pass, total]);
    }

    // Add extra students greedily
    for (int i = 0; i < extraStudents; i++) {
      var current = pop();

      int pass = current[1];
      int total = current[2];

      pass++;
      total++;

      push([gain(pass, total), pass, total]);
    }

    double result = 0;

    for (var item in heap) {
      int pass = item[1];
      int total = item[2];

      result += pass / total;
    }

    return result / classes.length;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-average-pass-ratio/)