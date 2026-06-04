class Solution {
  int numSplits(String s) {
    int n = s.length;

    List<int> left = List.filled(n, 0);
    List<int> right = List.filled(n, 0);

    Set<String> seen = {};

    for (int i = 0; i < n; i++) {
      seen.add(s[i]);
      left[i] = seen.length;
    }

    seen.clear();

    for (int i = n - 1; i >= 0; i--) {
      seen.add(s[i]);
      right[i] = seen.length;
    }

    int ans = 0;

    for (int i = 0; i < n - 1; i++) {
      if (left[i] == right[i + 1]) {
        ans++;
      }
    }

    return ans;
  }
}