class Solution {
  int maxEnvelopes(List<List<int>> envelopes) {
    envelopes.sort((a, b) {
      if (a[0] == b[0]) {
        return b[1] - a[1]; // height descending if width same
      }
      return a[0] - b[0];
    });

    List<int> lis = [];

    for (var env in envelopes) {
      int h = env[1];

      int left = 0;
      int right = lis.length;

      // binary search position
      while (left < right) {
        int mid = (left + right) ~/ 2;
        if (lis[mid] < h) {
          left = mid + 1;
        } else {
          right = mid;
        }
      }

      if (left == lis.length) {
        lis.add(h);
      } else {
        lis[left] = h;
      }
    }

    return lis.length;
  }
}