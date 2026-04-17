class Solution {
  List<bool> canMakePaliQueries(String s, List<List<int>> queries) {
    int n = s.length;
    List<int> prefix = List.filled(n + 1, 0);

    // build prefix bitmask
    for (int i = 0; i < n; i++) {
      int bit = 1 << (s.codeUnitAt(i) - 'a'.codeUnitAt(0));
      prefix[i + 1] = prefix[i] ^ bit;
    }

    List<bool> result = [];

    for (var q in queries) {
      int left = q[0], right = q[1], k = q[2];

      int mask = prefix[right + 1] ^ prefix[left];

      // count set bits (odd chars)
      int odd = _countBits(mask);

      result.add((odd ~/ 2) <= k);
    }

    return result;
  }

  int _countBits(int x) {
    int count = 0;
    while (x > 0) {
      x &= (x - 1); // remove lowest set bit
      count++;
    }
    return count;
  }
}