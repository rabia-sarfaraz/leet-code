class Solution {
  int movesToMakeZigzag(List<int> nums) {
    int n = nums.length;
    
    int solve(int start) {
      int moves = 0;
      
      for (int i = 0; i < n; i++) {
        if (i % 2 == start) {
          int left = i > 0 ? nums[i - 1] : 1000000000;
          int right = i < n - 1 ? nums[i + 1] : 1000000000;
          
          int minNeighbor = left < right ? left : right;
          
          if (nums[i] >= minNeighbor) {
            moves += nums[i] - (minNeighbor - 1);
          }
        }
      }
      
      return moves;
    }
    
    return solve(0) < solve(1) ? solve(0) : solve(1);
  }
}