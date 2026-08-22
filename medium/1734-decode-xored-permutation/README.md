# Decode XORed Permutation

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

There is an integer array perm that is a permutation of the first n positive integers, where n is always odd.

It was encoded into another integer array encoded of length n - 1, such that encoded[i] = perm[i] XOR perm[i + 1]. For example, if perm = [1,3,2], then encoded = [2,1].

Given the encoded array, return the original array perm. It is guaranteed that the answer exists and is unique.

 
Example 1:

Input: encoded = [3,1]
Output: [1,2,3]
Explanation: If perm = [1,2,3], then encoded = [1 XOR 2,2 XOR 3] = [3,1]


Example 2:

Input: encoded = [6,5,4,6]
Output: [2,4,1,5,3]


 
Constraints:


	3 <= n < 105
	n is odd.
	encoded.length == n - 1

## Solution

**Language:** dart  
**Runtime:** 11 ms (beats 100.00%)  
**Memory:** 203.8 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:46:16.163Z  

```dart
class Solution {
  List<int> decode(List<int> encoded) {
    int n = encoded.length + 1;

    // 1 ^ 2 ^ 3 ^ ... ^ n
    int total = 0;
    for (int i = 1; i <= n; i++) {
      total ^= i;
    }

    // encoded ke odd indices ka XOR
    int odd = 0;
    for (int i = 1; i < encoded.length; i += 2) {
      odd ^= encoded[i];
    }

    // ans[0] find karo
    int first = total ^ odd;

    List<int> ans = [first];

    // Baqi permutation decode karo
    for (int x in encoded) {
      ans.add(ans.last ^ x);
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/decode-xored-permutation/)