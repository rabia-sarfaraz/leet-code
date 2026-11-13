
class Solution {
  int countNonDecreasingSubarrays(List<int> nums, int k) {
    int n = nums.length;

    List<int> values = List.filled(n, 0);
    List<int> counts = List.filled(n, 0);

    int head = 0;
    int tail = 0;

    int right = n - 1;
    int cost = 0;
    int ans = 0;

    for (int left = n - 1; left >= 0; left--) {
      int num = nums[left];
      int count = 1;

      while (tail > head && values[tail - 1] < num) {
        tail--;

        count += counts[tail];
        cost += (num - values[tail]) * counts[tail];
      }

      values[tail] = num;
      counts[tail] = count;
      tail++;

      while (cost > k) {
        int rightmostValue = values[head];

        cost -= rightmostValue - nums[right];
        right--;

        if (counts[head] > 1) {
          counts[head]--;
        } else {
          head++;
        }
      }

      ans += right - left + 1;
    }

    return ans;
  }
}
