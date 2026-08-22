# Minimum Number of People to Teach

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

On a social network consisting of m users and some friendships between users, two users can communicate with each other if they know a common language.

You are given an integer n, an array languages, and an array friendships where:


	There are n languages numbered 1 through n,
	languages[i] is the set of languages the i​​​​​​th​​​​ user knows, and
	friendships[i] = [u​​​​​​i​​​, v​​​​​​i] denotes a friendship between the users u​​​​​​​​​​​i​​​​​ and vi.


You can choose one language and teach it to some users so that all friends can communicate with each other. Return the minimum number of users you need to teach.
Note that friendships are not transitive, meaning if x is a friend of y and y is a friend of z, this doesn't guarantee that x is a friend of z.
 
Example 1:

Input: n = 2, languages = [[1],[2],[1,2]], friendships = [[1,2],[1,3],[2,3]]
Output: 1
Explanation: You can either teach user 1 the second language or user 2 the first language.


Example 2:

Input: n = 3, languages = [[2],[1,3],[1,2],[3]], friendships = [[1,4],[1,2],[3,4],[2,3]]
Output: 2
Explanation: Teach the third language to users 1 and 3, yielding two users to teach.


 
Constraints:


	2 <= n <= 500
	languages.length == m
	1 <= m <= 500
	1 <= languages[i].length <= n
	1 <= languages[i][j] <= n
	1 <= u​​​​​​i < v​​​​​​i <= languages.length
	1 <= friendships.length <= 500
	All tuples (u​​​​​i, v​​​​​​i) are unique
	languages[i] contains only unique values

## Solution

**Language:** dart  
**Runtime:** 100 ms (beats 100.00%)  
**Memory:** 187.7 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:45:02.830Z  

```dart
class Solution {
  int minimumTeachings(
      int n,
      List<List<int>> languages,
      List<List<int>> friendships) {
    
    Set<int> needTeach = {};

    // Jin friendships mein common language nahi hai
    // un users ko find karo
    for (var friendship in friendships) {
      int u = friendship[0] - 1;
      int v = friendship[1] - 1;

      Set<int> langU = languages[u].toSet();

      bool canCommunicate = false;

      for (int lang in languages[v]) {
        if (langU.contains(lang)) {
          canCommunicate = true;
          break;
        }
      }

      if (!canCommunicate) {
        needTeach.add(u);
        needTeach.add(v);
      }
    }

    int answer = languages.length;

    // Har language ko try karo
    for (int lang = 1; lang <= n; lang++) {
      int count = 0;

      // Kitne required users ko ye language nahi aati
      for (int user in needTeach) {
        if (!languages[user].contains(lang)) {
          count++;
        }
      }

      answer = answer < count ? answer : count;
    }

    return answer;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-number-of-people-to-teach/)