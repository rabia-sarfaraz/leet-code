class Solution {
  int closestTarget(List<String> words, String target, int startIndex) {
    int n = words.length;
    int ans = n + 1;

    for (int i = 0; i < n; i++) {
      if (words[i] == target) {
        int diff = (i - startIndex).abs();
        int dist = diff < (n - diff) ? diff : (n - diff);
        if (dist < ans) ans = dist;
      }
    }

    return ans == n + 1 ? -1 : ans;
  }
}