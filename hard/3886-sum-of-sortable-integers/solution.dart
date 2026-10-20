
class Solution {
  int sortableIntegers(List<int> nums) {
    int n = nums.length;

    List<int> prefMax = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefMax[i + 1] = prefMax[i] > nums[i]
          ? prefMax[i]
          : nums[i];
    }

    List<int> suffMin = List.filled(n + 1, 1000000001);
    for (int i = n - 1; i >= 0; i--) {
      suffMin[i] = suffMin[i + 1] < nums[i]
          ? suffMin[i + 1]
          : nums[i];
    }

    List<int> prefDrop = List.filled(n, 0);
    for (int i = 1; i < n; i++) {
      prefDrop[i] = prefDrop[i - 1];
      if (nums[i - 1] > nums[i]) {
        prefDrop[i]++;
      }
    }

    bool check(int k) {
      for (int start = 0; start < n; start += k) {
        int end = start + k - 1;

        int drops = prefDrop[end] - prefDrop[start];

        if (nums[end] > nums[start]) {
          drops++;
        }

        if (drops > 1 || prefMax[start] > suffMin[start]) {
          return false;
        }
      }

      return true;
    }

    int answer = 0;

    for (int i = 1; i <= n ~/ i; i++) {
      if (n % i == 0) {
        if (check(i)) {
          answer += i;
        }

        int other = n ~/ i;
        if (other != i && check(other)) {
          answer += other;
        }
      }
    }

    return answer;
  }
}
