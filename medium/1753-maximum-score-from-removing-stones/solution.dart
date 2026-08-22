class Solution {
  int maximumScore(int a, int b, int c) {
    List<int> piles = [a, b, c];
    piles.sort();

    // Do smallest piles se pairs banao
    int small = piles[0];
    int medium = piles[1];
    int large = piles[2];

    int score = 0;

    // Case 1: largest pile <= other two combined
    if (large <= small + medium) {
      score = (a + b + c) ~/ 2;
    } 
    // Case 2: largest pile zyada hai
    else {
      score = small + medium;
    }

    return score;
  }
}