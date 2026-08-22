class Solution {
  int minAbsDifference(List<int> nums, int goal) {
    int n = nums.length;
    int mid = n ~/ 2;

    List<int> left = [];
    List<int> right = [];

    void generate(List<int> arr, int index, int sum, List<int> result) {
      if (index == arr.length) {
        result.add(sum);
        return;
      }

      // Current element skip
      generate(arr, index + 1, sum, result);

      // Current element take
      generate(arr, index + 1, sum + arr[index], result);
    }

    generate(nums.sublist(0, mid), 0, 0, left);
    generate(nums.sublist(mid), 0, 0, right);

    right.sort();

    int answer = (goal - 0).abs();

    for (int x in left) {
      int target = goal - x;

      // Binary search
      int low = 0;
      int high = right.length - 1;

      while (low <= high) {
        int m = (low + high) ~/ 2;

        if (right[m] < target) {
          low = m + 1;
        } else {
          high = m - 1;
        }
      }

      // right[low] closest greater/equal value
      if (low < right.length) {
        int sum = x + right[low];
        answer = answer < (sum - goal).abs()
            ? answer
            : (sum - goal).abs();
      }

      // right[low - 1] closest smaller value
      if (low > 0) {
        int sum = x + right[low - 1];
        answer = answer < (sum - goal).abs()
            ? answer
            : (sum - goal).abs();
      }
    }

    return answer;
  }
}