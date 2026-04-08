class Solution {
  int shoppingOffers(List<int> price, List<List<int>> special, List<int> needs) {
    Map<String, int> memo = {};

    int dfs(List<int> curNeeds) {
      String key = curNeeds.join(',');

      if (memo.containsKey(key)) return memo[key]!;

      // cost without any special (direct buy)
      int minCost = 0;
      for (int i = 0; i < price.length; i++) {
        minCost += curNeeds[i] * price[i];
      }

      // try each special offer
      for (var offer in special) {
        List<int> newNeeds = List.from(curNeeds);
        bool valid = true;

        for (int i = 0; i < price.length; i++) {
          if (newNeeds[i] < offer[i]) {
            valid = false;
            break;
          }
          newNeeds[i] -= offer[i];
        }

        if (valid) {
          minCost = min(minCost, offer.last + dfs(newNeeds));
        }
      }

      memo[key] = minCost;
      return minCost;
    }

    return dfs(needs);
  }
}