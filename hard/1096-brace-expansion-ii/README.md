# Brace Expansion II

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Under the grammar given below, strings can represent a set of lowercase words. Let `R(expr)` denote the set of words the expression represents.

The grammar can best be understood through simple examples:

- Single letters represent a singleton set containing that word. R("a") = {"a"} R("w") = {"w"}
- When we take a comma-delimited list of two or more expressions, we take the union of possibilities. R("{a,b,c}") = {"a","b","c"} R("{{a,b},{b,c}}") = {"a","b","c"} (notice the final set only contains each word at most once)
- When we concatenate two expressions, we take the set of possible concatenations between two words where the first word comes from the first expression and the second word comes from the second expression. R("{a,b}{c,d}") = {"ac","ad","bc","bd"} R("a{b,c}{d,e}f{g,h}") = {"abdfg", "abdfh", "abefg", "abefh", "acdfg", "acdfh", "acefg", "acefh"}

Formally, the three rules for our grammar:

- For every lowercase letter x, we have R(x) = {x}.
- For expressions e1, e2, ... , ek with k >= 2, we have R({e1, e2, ...}) = R(e1) ∪ R(e2) ∪ ...
- For expressions e1 and e2, we have R(e1 + e2) = {a + b for (a, b) in R(e1) × R(e2)}, where + denotes concatenation, and × denotes the cartesian product.

Given an expression representing a set of words under the given grammar, return *the sorted list of words that the expression represents*.

 

**Example 1:**

```
Input: expression = "{a,b}{c,{d,e}}"
Output: ["ac","ad","ae","bc","bd","be"]

```

**Example 2:**

```
Input: expression = "{{a,z},a{b,c},{ab,z}}"
Output: ["a","ab","ac","z"]
Explanation: Each distinct word is written only once in the final answer.

```

 

**Constraints:**

- 1 <= expression.length <= 60
- expression[i] consists of '{', '}', ','or lowercase English letters.
- The given expression represents a set of words based on the grammar given in the description.

## Solution

**Language:** dart  
**Runtime:** 22 ms (beats 100.00%)  
**Memory:** 154.4 MB (beats 100.00%)  
**Submitted:** 2026-09-25T04:57:53.550Z  

```dart
class Solution {
  List<String> braceExpansionII(String expression) {
    Set<String> result = _dfs(expression, 0, expression.length - 1);
    List<String> ans = result.toList();
    ans.sort();
    return ans;
  }

  Set<String> _dfs(String s, int start, int end) {
    List<Set<String>> groups = [<String>{}];

    // Current concatenation group
    Set<String> current = {""};

    int level = 0;
    int braceStart = -1;

    for (int i = start; i <= end; i++) {
      String c = s[i];

      if (c == '{') {
        if (level == 0) {
          braceStart = i + 1;
        }
        level++;
      } else if (c == '}') {
        level--;

        if (level == 0) {
          Set<String> inside = _dfs(s, braceStart, i - 1);
          current = _multiply(current, inside);
        }
      } else if (c == ',' && level == 0) {
        groups[groups.length - 1].addAll(current);
        groups.add(<String>{});
        current = {""};
      } else if (level == 0) {
        current = _multiply(current, {c});
      }
    }

    groups[groups.length - 1].addAll(current);

    Set<String> result = {};
    for (Set<String> group in groups) {
      result.addAll(group);
    }

    return result;
  }

  Set<String> _multiply(Set<String> a, Set<String> b) {
    Set<String> result = {};

    for (String x in a) {
      for (String y in b) {
        result.add(x + y);
      }
    }

    return result;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/brace-expansion-ii/)