class Solution {
  int candy(List<int> ratings) {
    int n = ratings.length;
    if (n == 0) return 0;

    List<int> candies = List.filled(n, 1);

    // 🔥 Left to right
    for (int i = 1; i < n; i++) {
      if (ratings[i] > ratings[i - 1]) {
        candies[i] = candies[i - 1] + 1;
      }
    }

    // 🔥 Right to left (FIXED)
    for (int i = n - 2; i >= 0; i--) {
      if (ratings[i] > ratings[i + 1]) {
        int needed = candies[i + 1] + 1;
        if (candies[i] < needed) {
          candies[i] = needed;
        }
      }
    }

    int sum = 0;
    for (int c in candies) {
      sum += c;
    }

    return sum;
  }
}