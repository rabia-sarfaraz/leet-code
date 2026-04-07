class Solution {
  List<String> findRelativeRanks(List<int> score) {
    int n = score.length;

    // Pair (score, index)
    List<List<int>> arr = [];
    for (int i = 0; i < n; i++) {
      arr.add([score[i], i]);
    }

    // Sort descending by score
    arr.sort((a, b) => b[0].compareTo(a[0]));

    List<String> result = List.filled(n, "");

    for (int i = 0; i < n; i++) {
      int idx = arr[i][1];

      if (i == 0) {
        result[idx] = "Gold Medal";
      } else if (i == 1) {
        result[idx] = "Silver Medal";
      } else if (i == 2) {
        result[idx] = "Bronze Medal";
      } else {
        result[idx] = (i + 1).toString();
      }
    }

    return result;
  }
}