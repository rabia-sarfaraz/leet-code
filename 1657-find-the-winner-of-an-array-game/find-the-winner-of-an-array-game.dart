class Solution {
  int getWinner(List<int> arr, int k) {
    int winner = arr[0];
    int streak = 0;

    for (int i = 1; i < arr.length; i++) {
      if (winner > arr[i]) {
        streak++;
      } else {
        winner = arr[i];
        streak = 1;
      }

      if (streak == k) {
        return winner;
      }
    }

    return winner;
  }
}