
import 'dart:math';

class Solution {
  List<int> sumAndMultiply(String s, List<List<int>> queries) {
    const int MOD = 1000000007;

    List<int> pos = [];
    List<int> digit = [];

    for (int i = 0; i < s.length; i++) {
      int d = s.codeUnitAt(i) - 48;
      if (d != 0) {
        pos.add(i);
        digit.add(d);
      }
    }

    int m = digit.length;

    List<int> pow10 = List.filled(m + 1, 1);
    for (int i = 1; i <= m; i++) {
      pow10[i] = (pow10[i - 1] * 10) % MOD;
    }

    List<int> prefixSum = List.filled(m + 1, 0);
    List<int> prefixNum = List.filled(m + 1, 0);

    for (int i = 0; i < m; i++) {
      prefixSum[i + 1] = prefixSum[i] + digit[i];
      prefixNum[i + 1] =
          ((prefixNum[i] * 10) % MOD + digit[i]) % MOD;
    }

    List<int> ans = [];

    for (var q in queries) {
      int l = q[0];
      int r = q[1];

      int left = _lowerBound(pos, l);
      int right = _upperBound(pos, r) - 1;

      if (left > right) {
        ans.add(0);
        continue;
      }

      int len = right - left + 1;

      int sum = prefixSum[right + 1] - prefixSum[left];

      int number = prefixNum[right + 1] -
          (prefixNum[left] * pow10[len]) % MOD;

      number %= MOD;
      if (number < 0) number += MOD;

      ans.add((number * (sum % MOD)) % MOD);
    }

    return ans;
  }

  int _lowerBound(List<int> arr, int target) {
    int l = 0, r = arr.length;
    while (l < r) {
      int mid = (l + r) >> 1;
      if (arr[mid] < target) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }
    return l;
  }

  int _upperBound(List<int> arr, int target) {
    int l = 0, r = arr.length;
    while (l < r) {
      int mid = (l + r) >> 1;
      if (arr[mid] <= target) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }
    return l;
  }
}