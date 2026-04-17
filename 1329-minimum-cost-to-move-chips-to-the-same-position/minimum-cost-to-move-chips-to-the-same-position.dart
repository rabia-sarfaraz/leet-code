class Solution {
  int minCostToMoveChips(List<int> position) {
    int even = 0;
    int odd = 0;

    for (int p in position) {
      if (p % 2 == 0) {
        even++;
      } else {
        odd++;
      }
    }

    return even < odd ? even : odd;
  }
}