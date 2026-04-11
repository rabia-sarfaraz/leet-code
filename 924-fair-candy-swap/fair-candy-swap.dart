class Solution {
  List<int> fairCandySwap(List<int> aliceSizes, List<int> bobSizes) {
    int sumA = 0;
    int sumB = 0;

    for (int x in aliceSizes) sumA += x;
    for (int x in bobSizes) sumB += x;

    int diff = (sumA - sumB) ~/ 2;

    Set<int> bobSet = bobSizes.toSet();

    for (int a in aliceSizes) {
      int b = a - diff;
      if (bobSet.contains(b)) {
        return [a, b];
      }
    }

    return [];
  }
}