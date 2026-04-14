class Solution {
  int numTilePossibilities(String tiles) {
    List<int> freq = List.filled(26, 0);

    for (int i = 0; i < tiles.length; i++) {
      freq[tiles.codeUnitAt(i) - 65]++; // 'A' = 65
    }

    int dfs() {
      int count = 0;

      for (int i = 0; i < 26; i++) {
        if (freq[i] == 0) continue;

        // choose this letter
        freq[i]--;
        count += 1 + dfs(); // +1 for current sequence
        freq[i]++;
      }

      return count;
    }

    return dfs();
  }
}