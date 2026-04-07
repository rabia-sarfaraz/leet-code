import 'dart:math';

class Solution {
  String smallestGoodBase(String n) {
    BigInt num = BigInt.parse(n);

    int maxM = (log(num.toDouble()) / log(2)).toInt();

    for (int m = maxM; m >= 2; m--) {
      BigInt k = _findBase(num, m);
      if (k != BigInt.zero) {
        return k.toString();
      }
    }

    return (num - BigInt.one).toString();
  }

  BigInt _findBase(BigInt n, int m) {
    BigInt left = BigInt.two;
    BigInt right = n;

    while (left <= right) {
      BigInt mid = (left + right) ~/ BigInt.two;

      BigInt sum = BigInt.zero;
      BigInt cur = BigInt.one;

      for (int i = 0; i <= m; i++) {
        sum += cur;
        cur *= mid;
        if (sum > n) break;
      }

      if (sum == n) return mid;
      if (sum < n) {
        left = mid + BigInt.one;
      } else {
        right = mid - BigInt.one;
      }
    }

    return BigInt.zero;
  }
}