class Solution {
  List<double> getCollisionTimes(List<List<int>> cars) {
    int n = cars.length;
    List<double> ans = List.filled(n, -1.0);
    List<int> stack = [];

    for (int i = n - 1; i >= 0; i--) {
      int position = cars[i][0];
      int speed = cars[i][1];

      while (stack.isNotEmpty) {
        int j = stack.last;

        int nextPosition = cars[j][0];
        int nextSpeed = cars[j][1];

        // Current car is not faster than the car ahead
        if (speed <= nextSpeed) {
          stack.removeLast();
          continue;
        }

        double time =
            (nextPosition - position) / (speed - nextSpeed);

        // Car j will collide before j collides with another car
        // OR j never collides, so current car can hit j.
        if (ans[j] < 0 || time <= ans[j]) {
          ans[i] = time;
          break;
        }

        // j will already have collided before current reaches it
        stack.removeLast();
      }

      stack.add(i);
    }

    return ans;
  }
}