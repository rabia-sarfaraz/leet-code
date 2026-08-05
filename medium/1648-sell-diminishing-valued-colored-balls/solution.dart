class Solution {
  static const int MOD = 1000000007;

  int maxProfit(List<int> inventory, int orders) {
    inventory.sort();

    int n = inventory.length;
    int i = n - 1;
    int colors = 1;
    int ans = 0;

    while (orders > 0) {
      int cur = inventory[i];
      int next = (i > 0) ? inventory[i - 1] : 0;

      int count = (cur - next) * colors;

      if (orders >= count) {
        ans = (ans +
                colors *
                    (((cur + next + 1) * (cur - next) ~/ 2) % MOD)) %
            MOD;
        orders -= count;
      } else {
        int full = orders ~/ colors;
        int rem = orders % colors;
        int low = cur - full;

        ans = (ans +
                colors *
                    (((cur + low + 1) * full ~/ 2) % MOD)) %
            MOD;

        ans = (ans + rem * low) % MOD;
        orders = 0;
      }

      i--;
      colors++;

      if (i < 0) break;
    }

    return ans % MOD;
  }
}