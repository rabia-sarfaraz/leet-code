# Fancy Sequence

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Write an API that generates fancy sequences using the append, addAll, and multAll operations.

Implement the Fancy class:


	Fancy() Initializes the object with an empty sequence.
	void append(val) Appends an integer val to the end of the sequence.
	void addAll(inc) Increments all existing values in the sequence by an integer inc.
	void multAll(m) Multiplies all existing values in the sequence by an integer m.
	int getIndex(idx) Gets the current value at index idx (0-indexed) of the sequence modulo 109 + 7. If the index is greater or equal than the length of the sequence, return -1.


 
Example 1:

Input
["Fancy", "append", "addAll", "append", "multAll", "getIndex", "addAll", "append", "multAll", "getIndex", "getIndex", "getIndex"]
[[], [2], [3], [7], [2], [0], [3], [10], [2], [0], [1], [2]]
Output
[null, null, null, null, null, 10, null, null, null, 26, 34, 20]

Explanation
Fancy fancy = new Fancy();
fancy.append(2);   // fancy sequence: [2]
fancy.addAll(3);   // fancy sequence: [2+3] -> [5]
fancy.append(7);   // fancy sequence: [5, 7]
fancy.multAll(2);  // fancy sequence: [5*2, 7*2] -> [10, 14]
fancy.getIndex(0); // return 10
fancy.addAll(3);   // fancy sequence: [10+3, 14+3] -> [13, 17]
fancy.append(10);  // fancy sequence: [13, 17, 10]
fancy.multAll(2);  // fancy sequence: [13*2, 17*2, 10*2] -> [26, 34, 20]
fancy.getIndex(0); // return 26
fancy.getIndex(1); // return 34
fancy.getIndex(2); // return 20


 
Constraints:


	1 <= val, inc, m <= 100
	0 <= idx <= 105
	At most 105 calls total will be made to append, addAll, multAll, and getIndex.

## Solution

**Language:** dart  
**Runtime:** 75 ms  
**Memory:** 246.9 MB (beats 100.00%)  
**Submitted:** 2026-08-04T04:54:45.326Z  

```dart
class Fancy {
  static const int MOD = 1000000007;

  List<int> values = [];
  int mul = 1;
  int add = 0;

  Fancy();

  int modPow(int a, int b) {
    int res = 1;
    int x = a;
    while (b > 0) {
      if ((b & 1) == 1) {
        res = (res * x) % MOD;
      }
      x = (x * x) % MOD;
      b >>= 1;
    }
    return res;
  }

  int modInverse(int x) {
    return modPow(x, MOD - 2);
  }

  void append(int val) {
    int inv = modInverse(mul);
    int original = (((val - add) % MOD + MOD) % MOD);
    original = (original * inv) % MOD;
    values.add(original);
  }

  void addAll(int inc) {
    add = (add + inc) % MOD;
  }

  void multAll(int m) {
    mul = (mul * m) % MOD;
    add = (add * m) % MOD;
  }

  int getIndex(int idx) {
    if (idx >= values.length) return -1;
    return (values[idx] * mul + add) % MOD;
  }
}

/**
 * Your Fancy object will be instantiated and called as such:
 * Fancy obj = Fancy();
 * obj.append(val);
 * obj.addAll(inc);
 * obj.multAll(m);
 * int param4 = obj.getIndex(idx);
 */
```

---

[View on LeetCode](https://leetcode.com/problems/fancy-sequence/)