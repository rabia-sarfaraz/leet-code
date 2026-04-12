class Solution {
  String shortestSuperstring(List<String> words) {
    int n = words.length;

    // overlap[i][j] = how many chars we can overlap when i -> j
    List<List<int>> overlap = List.generate(
      n,
      (_) => List.filled(n, 0),
    );

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (i == j) continue;

        int maxLen = words[i].length < words[j].length
            ? words[i].length
            : words[j].length;

        for (int k = maxLen; k >= 0; k--) {
          if (words[i].substring(words[i].length - k) ==
              words[j].substring(0, k)) {
            overlap[i][j] = k;
            break;
          }
        }
      }
    }

    int size = 1 << n;
    List<List<int>> dp = List.generate(
      size,
      (_) => List.filled(n, -1),
    );

    List<List<int>> parent = List.generate(
      size,
      (_) => List.filled(n, -1),
    );

    List<List<int>> nextChoice = List.generate(
      size,
      (_) => List.filled(n, -1),
    );

    int solve(int mask, int last) {
      if (mask == size - 1) return 0;
      if (dp[mask][last] != -1) return dp[mask][last];

      int best = 1 << 30;
      int bestNext = -1;

      for (int nxt = 0; nxt < n; nxt++) {
        if ((mask & (1 << nxt)) == 0) {
          int newMask = mask | (1 << nxt);
          int cost = words[nxt].length - overlap[last][nxt] +
              solve(newMask, nxt);

          if (cost < best) {
            best = cost;
            bestNext = nxt;
          }
        }
      }

      nextChoice[mask][last] = bestNext;
      return dp[mask][last] = best;
    }

    int start = 0;
    int bestLen = 1 << 30;

    for (int i = 0; i < n; i++) {
      int len = words[i].length + solve(1 << i, i);
      if (len < bestLen) {
        bestLen = len;
        start = i;
      }
    }

    // reconstruct path
    int mask = 1 << start;
    int last = start;
    List<int> order = [start];

    while (true) {
      int nxt = nextChoice[mask][last];
      if (nxt == -1) break;
      order.add(nxt);
      mask |= (1 << nxt);
      last = nxt;
    }

    // build answer
    String res = words[order[0]];
    for (int i = 1; i < order.length; i++) {
      int i1 = order[i - 1];
      int i2 = order[i];
      int ol = overlap[i1][i2];
      res += words[i2].substring(ol);
    }

    return res;
  }
}