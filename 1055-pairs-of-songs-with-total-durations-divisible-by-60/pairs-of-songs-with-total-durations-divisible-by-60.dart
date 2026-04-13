class Solution {
  int numPairsDivisibleBy60(List<int> time) {
    List<int> freq = List.filled(60, 0);
    int count = 0;

    for (int t in time) {
      int r = t % 60;
      int complement = (60 - r) % 60;

      count += freq[complement];

      freq[r]++;
    }

    return count;
  }
}