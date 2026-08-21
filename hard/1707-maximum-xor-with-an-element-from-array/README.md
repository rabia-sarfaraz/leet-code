# Maximum XOR With an Element From Array

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an array nums consisting of non-negative integers. You are also given a queries array, where queries[i] = [xi, mi].

The answer to the ith query is the maximum bitwise XOR value of xi and any element of nums that does not exceed mi. In other words, the answer is max(nums[j] XOR xi) for all j such that nums[j] <= mi. If all elements in nums are larger than mi, then the answer is -1.

Return an integer array answer where answer.length == queries.length and answer[i] is the answer to the ith query.

 
Example 1:

Input: nums = [0,1,2,3,4], queries = [[3,1],[1,3],[5,6]]
Output: [3,3,7]
Explanation:
1) 0 and 1 are the only two integers not greater than 1. 0 XOR 3 = 3 and 1 XOR 3 = 2. The larger of the two is 3.
2) 1 XOR 2 = 3.
3) 5 XOR 2 = 7.


Example 2:

Input: nums = [5,2,4,6,6,3], queries = [[12,4],[8,1],[6,3]]
Output: [15,-1,5]


 
Constraints:


	1 <= nums.length, queries.length <= 105
	queries[i].length == 2
	0 <= nums[j], xi, mi <= 109

## Solution

**Language:** dart  
**Runtime:** 289 ms (beats 100.00%)  
**Memory:** 297.2 MB (beats 100.00%)  
**Submitted:** 2026-08-21T07:13:18.354Z  

```dart
class Solution {
  List<int> maximizeXor(List<int> nums, List<List<int>> queries) {
    nums.sort();

    // [x, m, originalIndex]
    List<List<int>> qs = [];

    for (int i = 0; i < queries.length; i++) {
      qs.add([queries[i][0], queries[i][1], i]);
    }

    // Queries ko m ke according sort karo
    qs.sort((a, b) => a[1].compareTo(b[1]));

    List<int> ans = List.filled(queries.length, -1);

    Trie trie = Trie();
    int index = 0;

    for (var q in qs) {
      int x = q[0];
      int limit = q[1];
      int originalIndex = q[2];

      // limit se chote/equal nums Trie mein add karo
      while (index < nums.length && nums[index] <= limit) {
        trie.insert(nums[index]);
        index++;
      }

      if (index == 0) {
        ans[originalIndex] = -1;
      } else {
        ans[originalIndex] = trie.getMaxXor(x);
      }
    }

    return ans;
  }
}

class TrieNode {
  TrieNode? zero;
  TrieNode? one;
}

class Trie {
  TrieNode root = TrieNode();

  void insert(int num) {
    TrieNode node = root;

    for (int bit = 30; bit >= 0; bit--) {
      int b = (num >> bit) & 1;

      if (b == 0) {
        node.zero ??= TrieNode();
        node = node.zero!;
      } else {
        node.one ??= TrieNode();
        node = node.one!;
      }
    }
  }

  int getMaxXor(int num) {
    TrieNode node = root;
    int result = 0;

    for (int bit = 30; bit >= 0; bit--) {
      int b = (num >> bit) & 1;

      // XOR maximum ke liye opposite bit prefer karo
      if (b == 0) {
        if (node.one != null) {
          result |= (1 << bit);
          node = node.one!;
        } else {
          node = node.zero!;
        }
      } else {
        if (node.zero != null) {
          result |= (1 << bit);
          node = node.zero!;
        } else {
          node = node.one!;
        }
      }
    }

    return result;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-xor-with-an-element-from-array/)