class Solution {
  int _mx(int a, int b) => a > b ? a : b;
  int _mn(int a, int b) => a < b ? a : b;

  List<int> maxActiveSectionsAfterTrade(String s, List<List<int>> queries) {
    final n = s.length;

    int totalOnes = 0;
    for (int i = 0; i < n; i++) {
      if (s.codeUnitAt(i) == 49) totalOnes++;
    }

    // zero blocks
    final st = <int>[];
    final en = <int>[];
    int i = 0;
    while (i < n) {
      if (s.codeUnitAt(i) == 48) {
        int j = i;
        while (j < n && s.codeUnitAt(j) == 48) j++;
        st.add(i);
        en.add(j - 1);
        i = j;
      } else {
        i++;
      }
    }

    final m = st.length;
    final ans = List<int>.filled(queries.length, totalOnes);
    if (m < 2) return ans;

    // sparse table on adjacent-pair sums
    final P = m - 1;
    int LOG = 1;
    while ((1 << LOG) <= P) LOG++;
    final sp = List.generate(LOG, (_) => List<int>.filled(P, 0));
    for (int k = 0; k < P; k++) {
      sp[0][k] = (en[k] - st[k] + 1) + (en[k + 1] - st[k + 1] + 1);
    }
    for (int j = 1; j < LOG; j++) {
      for (int k = 0; k + (1 << j) <= P; k++) {
        sp[j][k] = _mx(sp[j - 1][k], sp[j - 1][k + (1 << (j - 1))]);
      }
    }

    int queryMax(int l, int r) {
      if (l < 0) l = 0;
      if (r > P - 1) r = P - 1;
      if (l > r) return 0;
      int j = 0;
      while ((1 << (j + 1)) <= r - l + 1) j++;
      return _mx(sp[j][l], sp[j][r - (1 << j) + 1]);
    }

    for (int q = 0; q < queries.length; q++) {
      final L = queries[q][0];
      final R = queries[q][1];

      // first zero-block with en >= L
      int lo = 0, hi = m - 1, first = m;
      while (lo <= hi) {
        final mid = (lo + hi) >> 1;
        if (en[mid] >= L) {
          first = mid;
          hi = mid - 1;
        } else {
          lo = mid + 1;
        }
      }
      // last zero-block with st <= R
      lo = 0;
      hi = m - 1;
      int last = -1;
      while (lo <= hi) {
        final mid = (lo + hi) >> 1;
        if (st[mid] <= R) {
          last = mid;
          lo = mid + 1;
        } else {
          hi = mid - 1;
        }
      }

      if (first >= m || last < 0 || last <= first) continue;

      final firstLen = _mn(en[first], R) - _mx(st[first], L) + 1;
      final lastLen = _mn(en[last], R) - _mx(st[last], L) + 1;

      int best = 0;

      // interior pairs: both blocks fully inside
      if (last - 2 >= first + 1) {
        best = _mx(best, queryMax(first + 1, last - 2));
      }

      // pair (first, first+1)
      final nxtLen = (first + 1 == last)
          ? lastLen
          : (en[first + 1] - st[first + 1] + 1);
      best = _mx(best, firstLen + nxtLen);

      // pair (last-1, last)
      final prvLen = (last - 1 == first)
          ? firstLen
          : (en[last - 1] - st[last - 1] + 1);
      best = _mx(best, prvLen + lastLen);

      ans[q] = totalOnes + best;
    }

    return ans;
  }
}