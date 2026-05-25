class Solution {
public:
    bool canReach(string s, int minJump, int maxJump) {

        int n = s.size();

        vector<bool> dp(n, false);

        dp[0] = true;

        int reachable = 0;

        for (int i = 1; i < n; i++) {

            // Add new reachable index
            if (i - minJump >= 0 && dp[i - minJump]) {
                reachable++;
            }

            // Remove out-of-range index
            if (i - maxJump - 1 >= 0 && dp[i - maxJump - 1]) {
                reachable--;
            }

            // Can reach current index
            if (s[i] == '0' && reachable > 0) {
                dp[i] = true;
            }
        }

        return dp[n - 1];
    }
};