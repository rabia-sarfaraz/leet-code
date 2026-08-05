class Solution {
  String slowestKey(List<int> releaseTimes, String keysPressed) {
    int maxDuration = releaseTimes[0];
    String ans = keysPressed[0];

    for (int i = 1; i < releaseTimes.length; i++) {
      int duration = releaseTimes[i] - releaseTimes[i - 1];

      if (duration > maxDuration ||
          (duration == maxDuration &&
              keysPressed[i].compareTo(ans) > 0)) {
        maxDuration = duration;
        ans = keysPressed[i];
      }
    }

    return ans;
  }
}