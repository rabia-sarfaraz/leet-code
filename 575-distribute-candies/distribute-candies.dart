class Solution {
  int distributeCandies(List<int> candyType) {
    int n = candyType.length;

    Set<int> s = {};

    for (int c in candyType) {
      s.add(c);
    }

    int unique = s.length;
    int limit = n ~/ 2;

    return unique < limit ? unique : limit;
  }
}