class Solution {
  List<int> movesToStamp(String stamp, String target) {
    int m = stamp.length;
    int n = target.length;

    List<String> t = target.split('');
    List<bool> visited = List.filled(n, false);
    List<int> result = [];

    bool changed = true;
    int stars = 0;

    bool canReplace(int i) {
      for (int j = 0; j < m; j++) {
        if (t[i + j] != '?' && t[i + j] != stamp[j]) {
          return false;
        }
      }
      return true;
    }

    void doReplace(int i) {
      for (int j = 0; j < m; j++) {
        if (t[i + j] != '?') {
          t[i + j] = '?';
          stars++;
        }
      }
    }

    while (stars < n) {
      bool didChange = false;

      for (int i = 0; i <= n - m; i++) {
        if (!visited[i] && canReplace(i)) {
          doReplace(i);
          visited[i] = true;
          didChange = true;
          result.add(i);

          if (stars == n) break;
        }
      }

      if (!didChange) return [];
    }

    return result.reversed.toList();
  }
}