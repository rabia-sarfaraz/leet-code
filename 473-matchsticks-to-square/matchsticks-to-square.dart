class Solution {
  bool makesquare(List<int> matchsticks) {
    int sum = matchsticks.reduce((a, b) => a + b);
    if (sum % 4 != 0) return false;

    int target = sum ~/ 4;

    matchsticks.sort((a, b) => b - a);

    List<int> sides = List.filled(4, 0);

    bool dfs(int index) {
      if (index == matchsticks.length) {
        return sides[0] == target &&
               sides[1] == target &&
               sides[2] == target &&
               sides[3] == target;
      }

      for (int i = 0; i < 4; i++) {
        if (sides[i] + matchsticks[index] > target) continue;

        sides[i] += matchsticks[index];

        if (dfs(index + 1)) return true;

        sides[i] -= matchsticks[index];
      }

      return false;
    }

    return dfs(0);
  }
}