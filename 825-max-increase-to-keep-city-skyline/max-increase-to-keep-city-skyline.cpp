class Solution {
public:
    int maxIncreaseKeepingSkyline(vector<vector<int>>& grid) {
        int n = grid.size();

        vector<int> rowMax(n, 0);
        vector<int> colMax(n, 0);

        // compute row max and col max
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                rowMax[i] = max(rowMax[i], grid[i][j]);
                colMax[j] = max(colMax[j], grid[i][j]);
            }
        }

        int result = 0;

        // compute possible increase
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                int allowed = min(rowMax[i], colMax[j]);
                result += allowed - grid[i][j];
            }
        }

        return result;
    }
};