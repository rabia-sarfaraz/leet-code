class Solution {
  bool isNStraightHand(List<int> hand, int groupSize) {
    if (hand.length % groupSize != 0) return false;

    hand.sort();
    Map<int, int> freq = {};

    for (int num in hand) {
      freq[num] = (freq[num] ?? 0) + 1;
    }

    for (int num in hand) {
      if (freq[num] == 0) continue;

      int start = num;

      for (int i = 0; i < groupSize; i++) {
        if ((freq[start + i] ?? 0) == 0) {
          return false;
        }
        freq[start + i] = freq[start + i]! - 1;
      }
    }

    return true;
  }
}