class Solution {
  int minSumSquareDiff(List<int> nums1, List<int> nums2, int k1, int k2) {
    int k = k1 + k2;
    int n = nums1.length;

    List<int> diff = List.filled(n, 0);
    int maxDiff = 0;
    int totalDiff = 0;

    for (int i = 0; i < n; i++) {
      int d = (nums1[i] - nums2[i]).abs();
      diff[i] = d;
      if (d > maxDiff) maxDiff = d;
      totalDiff += d;
    }

    if (k >= totalDiff) return 0;

    List<int> freq = List.filled(maxDiff + 1, 0);

    for (int d in diff) {
      freq[d]++;
    }

    for (int d = maxDiff; d > 0 && k > 0; d--) {
      if (freq[d] == 0) continue;

      int move = freq[d] < k ? freq[d] : k;

      freq[d] -= move;
      freq[d - 1] += move;
      k -= move;
    }

    int answer = 0;

    for (int d = 1; d < freq.length; d++) {
      answer += d * d * freq[d];
    }

    return answer;
  }
}