class Solution {
  int minSumOfLengths(List<int> arr, int target) {
    int n = arr.length;
    const int INF = 1 << 30;

    // best[i] = index 0..i tak kisi valid subarray ki
    // minimum length
    List<int> best = List.filled(n, INF);

    int left = 0;
    int sum = 0;
    int answer = INF;

    for (int right = 0; right < n; right++) {
      sum += arr[right];

      while (sum > target && left <= right) {
        sum -= arr[left];
        left++;
      }

      // Previous best ko carry forward karo
      if (right > 0) {
        best[right] = best[right - 1];
      }

      if (sum == target) {
        int length = right - left + 1;

        // [left ... right] se pehle wali
        // non-overlapping subarray honi chahiye
        if (left > 0 && best[left - 1] != INF) {
          int total = best[left - 1] + length;

          if (total < answer) {
            answer = total;
          }
        }

        // Current subarray ko best mein store karo
        if (length < best[right]) {
          best[right] = length;
        }
      }
    }

    return answer == INF ? -1 : answer;
  }
}