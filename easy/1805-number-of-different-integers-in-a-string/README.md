# Number of Different Integers in a String

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

You are given a string word that consists of digits and lowercase English letters.

You will replace every non-digit character with a space. For example, "a123bc34d8ef34" will become " 123  34 8  34". Notice that you are left with some integers that are separated by at least one space: "123", "34", "8", and "34".

Return the number of different integers after performing the replacement operations on word.

Two integers are considered different if their decimal representations without any leading zeros are different.

 
Example 1:

Input: word = "a123bc34d8ef34"
Output: 3
Explanation: The three different integers are "123", "34", and "8". Notice that "34" is only counted once.


Example 2:

Input: word = "leet1234code234"
Output: 2


Example 3:

Input: word = "a1b01c001"
Output: 1
Explanation: The three integers "1", "01", and "001" all represent the same integer because
the leading zeros are ignored when comparing their decimal values.


 
Constraints:


	1 <= word.length <= 1000
	word consists of digits and lowercase English letters.

## Solution

**Language:** Python  
**Runtime:** 2 ms (beats 69.23%)  
**Memory:** 12.4 MB (beats 17.95%)  
**Submitted:** 2026-08-24T03:28:06.257Z  

```py
class Solution(object):
    def numDifferentIntegers(self, word):
        """
        :type word: str
        :rtype: int
        """
        nums = set()
        i = 0

        while i < len(word):
            if word[i].isdigit():
                j = i

                while j < len(word) and word[j].isdigit():
                    j += 1

                # Remove leading zeros
                num = word[i:j].lstrip('0')

                # "000" should represent 0
                if num == "":
                    num = "0"

                nums.add(num)
                i = j
            else:
                i += 1

        return len(nums)
```

---

[View on LeetCode](https://leetcode.com/problems/number-of-different-integers-in-a-string/)