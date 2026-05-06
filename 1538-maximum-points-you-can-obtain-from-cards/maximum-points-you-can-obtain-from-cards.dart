class Solution {
  int maxScore(List<int> cardPoints, int k) {
    int n = cardPoints.length;

    // Step 1: Total sum
    int totalSum = 0;
    for (int num in cardPoints) {
      totalSum += num;
    }

    // Agar k == n hai to sab le lo
    if (k == n) return totalSum;

    int windowSize = n - k;

    // Step 2: First window sum
    int windowSum = 0;
    for (int i = 0; i < windowSize; i++) {
      windowSum += cardPoints[i];
    }

    int minSum = windowSum;

    // Step 3: Sliding window
    for (int i = windowSize; i < n; i++) {
      windowSum += cardPoints[i];
      windowSum -= cardPoints[i - windowSize];

      if (windowSum < minSum) {
        minSum = windowSum;
      }
    }

    // Step 4: Result
    return totalSum - minSum;
  }
}