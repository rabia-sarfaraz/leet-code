class Solution {
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    int maxCandies = candies.reduce((a, b) => a > b ? a : b);

    List<bool> result = [];

    for (int c in candies) {
      result.add(c + extraCandies >= maxCandies);
    }

    return result;
  }
}