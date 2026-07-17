class Solution {
  List<int> gcdValues(List<int> nums, List<int> queries) {
    int maxVal = 0;
    for (final x in nums) {
      if (x > maxVal) maxVal = x;
    }

    final cnt = List<int>.filled(maxVal + 1, 0);
    for (final x in nums) {
      cnt[x]++;
    }

    // pairs[g] = number of pairs whose gcd is exactly g
    final pairs = List<int>.filled(maxVal + 1, 0);
    for (int g = maxVal; g >= 1; g--) {
      int multiples = 0;
      for (int m = g; m <= maxVal; m += g) {
        multiples += cnt[m];
      }
      int total = multiples * (multiples - 1) ~/ 2;
      for (int m = 2 * g; m <= maxVal; m += g) {
        total -= pairs[m];
      }
      pairs[g] = total;
    }

    // prefix sums
    final prefix = List<int>.filled(maxVal + 1, 0);
    for (int g = 1; g <= maxVal; g++) {
      prefix[g] = prefix[g - 1] + pairs[g];
    }

    final ans = <int>[];
    for (final q in queries) {
      int lo = 1, hi = maxVal;
      while (lo < hi) {
        final mid = (lo + hi) >> 1;
        if (prefix[mid] > q) {
          hi = mid;
        } else {
          lo = mid + 1;
        }
      }
      ans.add(lo);
    }
    return ans;
  }
}