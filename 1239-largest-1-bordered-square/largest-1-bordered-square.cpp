class Solution {
public:
    int largest1BorderedSquare(vector<vector<int>>& grid) {
        int n = grid.size();
        int m = grid[0].size();
        
        vector<vector<int>> right(n, vector<int>(m, 0));
        vector<vector<int>> down(n, vector<int>(m, 0));
        
        // preprocess
        for (int i = n - 1; i >= 0; i--) {
            for (int j = m - 1; j >= 0; j--) {
                if (grid[i][j] == 1) {
                    right[i][j] = 1 + (j + 1 < m ? right[i][j + 1] : 0);
                    down[i][j] = 1 + (i + 1 < n ? down[i + 1][j] : 0);
                }
            }
        }
        
        int ans = 0;
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                int maxLen = min(n - i, m - j);
                
                for (int len = maxLen; len > 0; len--) {
                    if (right[i][j] >= len &&
                        down[i][j] >= len &&
                        down[i][j + len - 1] >= len &&
                        right[i + len - 1][j] >= len) {
                        
                        ans = max(ans, len * len);
                        break;
                    }
                }
            }
        }
        
        return ans;
    }
};