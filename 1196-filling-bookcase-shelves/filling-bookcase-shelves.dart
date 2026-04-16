class Solution {
  int minHeightShelves(List<List<int>> books, int shelfWidth) {
    int n = books.length;
    List<int> dp = List.filled(n + 1, 1000000000);
    
    dp[0] = 0;
    
    for (int i = 1; i <= n; i++) {
      int width = 0;
      int height = 0;
      
      for (int j = i; j >= 1; j--) {
        width += books[j - 1][0];
        
        if (width > shelfWidth) break;
        
        height = height > books[j - 1][1]
            ? height
            : books[j - 1][1];
        
        dp[i] = dp[i] < dp[j - 1] + height
            ? dp[i]
            : dp[j - 1] + height;
      }
    }
    
    return dp[n];
  }
}