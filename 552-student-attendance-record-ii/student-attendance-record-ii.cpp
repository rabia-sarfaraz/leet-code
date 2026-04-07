class Solution {
public:
    const int MOD = 1e9 + 7;

    int checkRecord(int n) {
        long dp[2][3] = {0}, newDp[2][3] = {0};

        dp[0][0] = 1;

        for (int i = 0; i < n; i++) {
            memset(newDp, 0, sizeof(newDp));

            for (int a = 0; a <= 1; a++) {
                for (int l = 0; l <= 2; l++) {
                    long val = dp[a][l];
                    if (!val) continue;

                    // Add 'P'
                    newDp[a][0] = (newDp[a][0] + val) % MOD;

                    // Add 'A'
                    if (a == 0)
                        newDp[1][0] = (newDp[1][0] + val) % MOD;

                    // Add 'L'
                    if (l < 2)
                        newDp[a][l + 1] = (newDp[a][l + 1] + val) % MOD;
                }
            }

            memcpy(dp, newDp, sizeof(dp));
        }

        long result = 0;
        for (int a = 0; a <= 1; a++)
            for (int l = 0; l <= 2; l++)
                result = (result + dp[a][l]) % MOD;

        return result;
    }
};