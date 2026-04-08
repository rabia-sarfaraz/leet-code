class Solution {
  int maxProfit(List<int> prices, int fee) {
    int cash = 0;
    int hold = -prices[0];

    for (int i = 1; i < prices.length; i++) {
      int price = prices[i];

      int prevCash = cash;

      cash = (cash > hold + price - fee) ? cash : hold + price - fee;
      hold = (hold > prevCash - price) ? hold : prevCash - price;
    }

    return cash;
  }
}