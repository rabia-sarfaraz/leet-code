class Solution {
  int maxProfit(int k, List<int> prices) {
    int n = prices.length;
    if (n == 0) return 0;

    // If k >= n/2 → unlimited transactions
    if (k >= n ~/ 2) {
      int profit = 0;
      for (int i = 1; i < n; i++) {
        if (prices[i] > prices[i - 1]) {
          profit += prices[i] - prices[i - 1];
        }
      }
      return profit;
    }

    List<int> buy = List.filled(k, -1000000000);
    List<int> sell = List.filled(k, 0);

    for (int price in prices) {
      for (int i = 0; i < k; i++) {
        if (i == 0) {
          buy[i] = (buy[i] > -price) ? buy[i] : -price;
        } else {
          buy[i] = (buy[i] > sell[i - 1] - price) ? buy[i] : sell[i - 1] - price;
        }

        sell[i] = (sell[i] > buy[i] + price) ? sell[i] : buy[i] + price;
      }
    }

    return sell[k - 1];
  }
}