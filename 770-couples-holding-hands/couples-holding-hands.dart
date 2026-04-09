class Solution {
  int minSwapsCouples(List<int> row) {
    int n = row.length;

    // person -> index map
    Map<int, int> pos = {};
    for (int i = 0; i < n; i++) {
      pos[row[i]] = i;
    }

    int swaps = 0;

    for (int i = 0; i < n; i += 2) {
      int first = row[i];
      int partner = first ^ 1;

      if (row[i + 1] == partner) continue;

      int partnerIndex = pos[partner]!;

      // swap row[i+1] with partner
      int temp = row[i + 1];
      row[i + 1] = row[partnerIndex];
      row[partnerIndex] = temp;

      // update positions
      pos[temp] = partnerIndex;
      pos[partner] = i + 1;

      swaps++;
    }

    return swaps;
  }
}