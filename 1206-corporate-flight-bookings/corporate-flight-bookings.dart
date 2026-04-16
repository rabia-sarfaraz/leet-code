class Solution {
  List<int> corpFlightBookings(List<List<int>> bookings, int n) {
    List<int> diff = List.filled(n, 0);
    
    // Step 1: apply difference array
    for (var b in bookings) {
      int first = b[0] - 1; // 0-based
      int last = b[1] - 1;
      int seats = b[2];
      
      diff[first] += seats;
      
      if (last + 1 < n) {
        diff[last + 1] -= seats;
      }
    }
    
    // Step 2: prefix sum
    for (int i = 1; i < n; i++) {
      diff[i] += diff[i - 1];
    }
    
    return diff;
  }
}