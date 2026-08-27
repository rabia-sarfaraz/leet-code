# Sentence Similarity III

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given two strings sentence1 and sentence2, each representing a sentence composed of words. A sentence is a list of words that are separated by a single space with no leading or trailing spaces. Each word consists of only uppercase and lowercase English characters.

Two sentences s1 and s2 are considered similar if it is possible to insert an arbitrary sentence (possibly empty) inside one of these sentences such that the two sentences become equal. Note that the inserted sentence must be separated from existing words by spaces.

For example,


	s1 = "Hello Jane" and s2 = "Hello my name is Jane" can be made equal by inserting "my name is" between "Hello" and "Jane" in s1.
	s1 = "Frog cool" and s2 = "Frogs are cool" are not similar, since although there is a sentence "s are" inserted into s1, it is not separated from "Frog" by a space.


Given two sentences sentence1 and sentence2, return true if sentence1 and sentence2 are similar. Otherwise, return false.

 
Example 1:


Input: sentence1 = "My name is Haley", sentence2 = "My Haley"

Output: true

Explanation:

sentence2 can be turned to sentence1 by inserting "name is" between "My" and "Haley".


Example 2:


Input: sentence1 = "of", sentence2 = "A lot of words"

Output: false

Explanation:

No single sentence can be inserted inside one of the sentences to make it equal to the other.


Example 3:


Input: sentence1 = "Eating right now", sentence2 = "Eating"

Output: true

Explanation:

sentence2 can be turned to sentence1 by inserting "right now" at the end of the sentence.


 
Constraints:


	1 <= sentence1.length, sentence2.length <= 100
	sentence1 and sentence2 consist of lowercase and uppercase English letters and spaces.
	The words in sentence1 and sentence2 are separated by a single space.

## Solution

**Language:** Python  
**Runtime:** 0 ms (beats 100.00%)  
**Memory:** 12.4 MB (beats 54.55%)  
**Submitted:** 2026-08-27T10:52:36.424Z  

```py
class Solution(object):
    def areSentencesSimilar(self, sentence1, sentence2):
        """
        :type sentence1: str
        :type sentence2: str
        :rtype: bool
        """

        a = sentence1.split()
        b = sentence2.split()

        # Make a the shorter sentence
        if len(a) > len(b):
            a, b = b, a

        n = len(a)

        # Common prefix
        left = 0
        while left < n and a[left] == b[left]:
            left += 1

        # Common suffix
        right = 0
        while right < n - left and a[n - 1 - right] == b[len(b) - 1 - right]:
            right += 1

        return left + right >= n
```

---

[View on LeetCode](https://leetcode.com/problems/sentence-similarity-iii/)