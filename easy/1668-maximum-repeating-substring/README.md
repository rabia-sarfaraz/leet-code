# Maximum Repeating Substring

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

For a string sequence, a string word is k-repeating if word concatenated k times is a substring of sequence. The word's maximum k-repeating value is the highest value k where word is k-repeating in sequence. If word is not a substring of sequence, word's maximum k-repeating value is 0.

Given strings sequence and word, return the maximum k-repeating value of word in sequence.

 
Example 1:

Input: sequence = "ababc", word = "ab"
Output: 2
Explanation: "abab" is a substring in "ababc".


Example 2:

Input: sequence = "ababc", word = "ba"
Output: 1
Explanation: "ba" is a substring in "ababc". "baba" is not a substring in "ababc".


Example 3:

Input: sequence = "ababc", word = "ac"
Output: 0
Explanation: "ac" is not a substring in "ababc". 


 
Constraints:


	1 <= sequence.length <= 100
	1 <= word.length <= 100
	sequence and word contains only lowercase English letters.

## Solution

**Language:** Python  
**Runtime:** 0 ms (beats 100.00%)  
**Memory:** 12.3 MB (beats 91.75%)  
**Submitted:** 2026-08-07T04:25:10.456Z  

```py
class Solution(object):
    def maxRepeating(self, sequence, word):
        """
        :type sequence: str
        :type word: str
        :rtype: int
        """
        count = 0
        temp = word
        
        while temp in sequence:
            count += 1
            temp += word
            
        return count
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-repeating-substring/)