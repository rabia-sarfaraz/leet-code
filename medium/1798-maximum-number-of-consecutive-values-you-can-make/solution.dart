class Solution {
  int getMaximumConsecutive(List<int> coins) {
    coins.sort();

    int reach = 0;

    for (int coin in coins) {
      if (coin > reach + 1) {
        break;
      }

      reach += coin;
    }

    return reach + 1;
  }
}