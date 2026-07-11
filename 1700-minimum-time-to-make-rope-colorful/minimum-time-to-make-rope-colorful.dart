class Solution {
  int minCost(String colors, List<int> neededTime) {
    int ans = 0;
    int i = 0;
    int n = colors.length;

    while (i < n) {
      int sum = neededTime[i];
      int maxTime = neededTime[i];
      int j = i + 1;

      while (j < n && colors[j] == colors[i]) {
        sum += neededTime[j];
        if (neededTime[j] > maxTime) {
          maxTime = neededTime[j];
        }
        j++;
      }

      ans += sum - maxTime;
      i = j;
    }

    return ans;
  }
}