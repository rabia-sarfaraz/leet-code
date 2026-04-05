class Solution {
  int maxProfit(List<int> prices) {
    if (prices.isEmpty) return 0;

    int hold = -prices[0];
    int sold = 0;
    int rest = 0;

    for (int i = 1; i < prices.length; i++) {
      int prevSold = sold;

      sold = hold + prices[i];              // sell today
      hold = hold > (rest - prices[i]) 
          ? hold 
          : (rest - prices[i]);             // buy or keep holding
      rest = rest > prevSold ? rest : prevSold; // cooldown or stay
    }

    return sold > rest ? sold : rest;
  }
}