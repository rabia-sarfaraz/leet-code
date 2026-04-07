import 'dart:math';

class Solution {
  late List<int> prefix;
  late int total;
  Random rand = Random();

  Solution(List<int> w) {
    prefix = [];
    int sum = 0;

    for (int weight in w) {
      sum += weight;
      prefix.add(sum);
    }

    total = sum;
  }

  int pickIndex() {
    int target = rand.nextInt(total) + 1;

    int left = 0, right = prefix.length - 1;

    while (left < right) {
      int mid = (left + right) ~/ 2;

      if (prefix[mid] < target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }

    return left;
  }
}