class Solution {
  List<int> arrayRankTransform(List<int> arr) {
    // Step 1: copy & sort
    List<int> sorted = List.from(arr);
    sorted.sort();

    // Step 2: assign ranks
    Map<int, int> rank = {};
    int r = 1;

    for (int num in sorted) {
      if (!rank.containsKey(num)) {
        rank[num] = r;
        r++;
      }
    }

    // Step 3: build result
    return arr.map((num) => rank[num]!).toList();
  }
}