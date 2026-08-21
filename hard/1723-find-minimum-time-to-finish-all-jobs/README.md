# Find Minimum Time to Finish All Jobs

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an integer array jobs, where jobs[i] is the amount of time it takes to complete the ith job.

There are k workers that you can assign jobs to. Each job should be assigned to exactly one worker. The working time of a worker is the sum of the time it takes to complete all jobs assigned to them. Your goal is to devise an optimal assignment such that the maximum working time of any worker is minimized.

Return the minimum possible maximum working time of any assignment. 

 
Example 1:

Input: jobs = [3,2,3], k = 3
Output: 3
Explanation: By assigning each person one job, the maximum time is 3.


Example 2:

Input: jobs = [1,2,4,7,8], k = 2
Output: 11
Explanation: Assign the jobs the following way:
Worker 1: 1, 2, 8 (working time = 1 + 2 + 8 = 11)
Worker 2: 4, 7 (working time = 4 + 7 = 11)
The maximum working time is 11.

 
Constraints:


	1 <= k <= jobs.length <= 12
	1 <= jobs[i] <= 107

## Solution

**Language:** dart  
**Runtime:** 9 ms (beats 100.00%)  
**Memory:** 150.1 MB (beats 100.00%)  
**Submitted:** 2026-08-21T10:39:28.791Z  

```dart
class Solution {
  int minimumTimeRequired(List<int> jobs, int k) {
    // Large jobs pehle assign karo
    jobs.sort((a, b) => b.compareTo(a));

    List<int> workers = List.filled(k, 0);
    int answer = jobs.fold(0, (a, b) => a + b);

    void backtrack(int index, int currentMax) {
      if (currentMax >= answer) return;

      if (index == jobs.length) {
        answer = currentMax;
        return;
      }

      int job = jobs[index];
      Set<int> usedLoads = {};

      for (int i = 0; i < k; i++) {
        // Same workload wale workers ko repeat na karo
        if (usedLoads.contains(workers[i])) continue;
        usedLoads.add(workers[i]);

        workers[i] += job;

        backtrack(
          index + 1,
          currentMax > workers[i] ? currentMax : workers[i],
        );

        workers[i] -= job;

        // Agar empty worker ko job dekar bhi solution nahi mila,
        // to doosre empty workers try karne ki zaroorat nahi
        if (workers[i] == 0) break;
      }
    }

    backtrack(0, 0);

    return answer;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/find-minimum-time-to-finish-all-jobs/)