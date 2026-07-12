class Solution {
  List<int> arrayRankTransform(List<int> arr) {
    List<int> sorted = List.from(arr);
    sorted.sort();

    Map<int, int> rank = {};
    int r = 1;

    for (int num in sorted) {
      if (!rank.containsKey(num)) {
        rank[num] = r++;
      }
    }

    return arr.map((num) => rank[num]!).toList();
  }
}