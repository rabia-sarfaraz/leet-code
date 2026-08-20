# Goal Parser Interpretation

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

You own a Goal Parser that can interpret a string command. The command consists of an alphabet of "G", "()" and/or "(al)" in some order. The Goal Parser will interpret "G" as the string "G", "()" as the string "o", and "(al)" as the string "al". The interpreted strings are then concatenated in the original order.

Given the string command, return the Goal Parser's interpretation of command.

 
Example 1:

Input: command = "G()(al)"
Output: "Goal"
Explanation: The Goal Parser interprets the command as follows:
G -> G
() -> o
(al) -> al
The final concatenated result is "Goal".


Example 2:

Input: command = "G()()()()(al)"
Output: "Gooooal"


Example 3:

Input: command = "(al)G(al)()()G"
Output: "alGalooG"


 
Constraints:


	1 <= command.length <= 100
	command consists of "G", "()", and/or "(al)" in some order.

## Solution

**Language:** Python  
**Runtime:** 3 ms (beats 99.58%)  
**Memory:** 12.5 MB (beats 17.54%)  
**Submitted:** 2026-08-20T04:34:36.536Z  

```py
class Solution(object):
    def interpret(self, command):
        return command.replace("()", "o").replace("(al)", "al")
```

---

[View on LeetCode](https://leetcode.com/problems/goal-parser-interpretation/)