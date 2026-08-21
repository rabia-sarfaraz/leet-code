class Solution {
  double averageWaitingTime(List<List<int>> customers) {
    int currentTime = 0;
    int totalWaiting = 0;

    for (var customer in customers) {
      int arrival = customer[0];
      int time = customer[1];

      // Chef customer ke arrival se pehle free ho sakta hai
      currentTime = max(currentTime, arrival);

      // Customer ka order complete hone ka time
      currentTime += time;

      // Waiting time
      totalWaiting += currentTime - arrival;
    }

    return totalWaiting / customers.length;
  }
}