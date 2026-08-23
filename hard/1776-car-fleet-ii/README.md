# Car Fleet II

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

There are n cars traveling at different speeds in the same direction along a one-lane road. You are given an array cars of length n, where cars[i] = [positioni, speedi] represents:


	positioni is the distance between the ith car and the beginning of the road in meters. It is guaranteed that positioni < positioni+1.
	speedi is the initial speed of the ith car in meters per second.


For simplicity, cars can be considered as points moving along the number line. Two cars collide when they occupy the same position. Once a car collides with another car, they unite and form a single car fleet. The cars in the formed fleet will have the same position and the same speed, which is the initial speed of the slowest car in the fleet.

Return an array answer, where answer[i] is the time, in seconds, at which the ith car collides with the next car, or -1 if the car does not collide with the next car. Answers within 10-5 of the actual answers are accepted.

 
Example 1:

Input: cars = [[1,2],[2,1],[4,3],[7,2]]
Output: [1.00000,-1.00000,3.00000,-1.00000]
Explanation: After exactly one second, the first car will collide with the second car, and form a car fleet with speed 1 m/s. After exactly 3 seconds, the third car will collide with the fourth car, and form a car fleet with speed 2 m/s.


Example 2:

Input: cars = [[3,4],[5,4],[6,3],[9,1]]
Output: [2.00000,1.00000,1.50000,-1.00000]


 
Constraints:


	1 <= cars.length <= 105
	1 <= positioni, speedi <= 106
	positioni < positioni+1

## Solution

**Language:** dart  
**Runtime:** 14 ms (beats 100.00%)  
**Memory:** 269.5 MB (beats 100.00%)  
**Submitted:** 2026-08-23T05:26:31.516Z  

```dart
class Solution {
  List<double> getCollisionTimes(List<List<int>> cars) {
    int n = cars.length;
    List<double> ans = List.filled(n, -1.0);
    List<int> stack = [];

    for (int i = n - 1; i >= 0; i--) {
      int position = cars[i][0];
      int speed = cars[i][1];

      while (stack.isNotEmpty) {
        int j = stack.last;

        int nextPosition = cars[j][0];
        int nextSpeed = cars[j][1];

        // Current car is not faster than the car ahead
        if (speed <= nextSpeed) {
          stack.removeLast();
          continue;
        }

        double time =
            (nextPosition - position) / (speed - nextSpeed);

        // Car j will collide before j collides with another car
        // OR j never collides, so current car can hit j.
        if (ans[j] < 0 || time <= ans[j]) {
          ans[i] = time;
          break;
        }

        // j will already have collided before current reaches it
        stack.removeLast();
      }

      stack.add(i);
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/car-fleet-ii/)