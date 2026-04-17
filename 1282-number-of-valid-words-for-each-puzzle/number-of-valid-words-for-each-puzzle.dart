class Solution {
  List<int> findNumOfValidWords(List<String> words, List<String> puzzles) {
    Map<int, int> freq = {};

    // Step 1: words → mask
    for (String word in words) {
      int mask = 0;
      for (int i = 0; i < word.length; i++) {
        mask |= 1 << (word.codeUnitAt(i) - 'a'.codeUnitAt(0));
      }

      // ignore words with >7 unique chars
      if (_countBits(mask) <= 7) {
        freq[mask] = (freq[mask] ?? 0) + 1;
      }
    }

    List<int> result = [];

    // Step 2: process each puzzle
    for (String puzzle in puzzles) {
      int first = 1 << (puzzle.codeUnitAt(0) - 'a'.codeUnitAt(0));

      // mask for remaining 6 letters
      int mask = 0;
      for (int i = 1; i < 7; i++) {
        mask |= 1 << (puzzle.codeUnitAt(i) - 'a'.codeUnitAt(0));
      }

      int sub = mask;
      int total = 0;

      // iterate all subsets
      while (true) {
        int candidate = sub | first;

        if (freq.containsKey(candidate)) {
          total += freq[candidate]!;
        }

        if (sub == 0) break;
        sub = (sub - 1) & mask;
      }

      result.add(total);
    }

    return result;
  }

  int _countBits(int x) {
    int count = 0;
    while (x > 0) {
      x &= (x - 1);
      count++;
    }
    return count;
  }
}