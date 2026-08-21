class Solution {
  int minOperations(List<int> target, List<int> arr) {
    Map<int, int> pos = {};

    // Target ke har element ki position
    for (int i = 0; i < target.length; i++) {
      pos[target[i]] = i;
    }

    // Arr ko target ki positions mein convert karo
    List<int> sequence = [];

    for (int x in arr) {
      if (pos.containsKey(x)) {
        sequence.add(pos[x]!);
      }
    }

    // LIS find karo
    List<int> lis = [];

    for (int x in sequence) {
      int left = 0;
      int right = lis.length;

      while (left < right) {
        int mid = (left + right) ~/ 2;

        if (lis[mid] < x) {
          left = mid + 1;
        } else {
          right = mid;
        }
      }

      if (left == lis.length) {
        lis.add(x);
      } else {
        lis[left] = x;
      }
    }

    return target.length - lis.length;
  }
}