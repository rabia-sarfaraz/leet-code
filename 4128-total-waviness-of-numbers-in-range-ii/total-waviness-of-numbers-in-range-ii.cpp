class Solution {
public:
    long long dp[20][11][11][2];
    long long cnt[20][11][11][2];
    string s;

    pair<long long, long long> dfs(int pos, int prev2, int prev1,
                                   bool started, bool tight) {
        if (pos == s.size()) {
            return {1, 0};
        }

        if (!tight && dp[pos][prev2][prev1][started] != -1) {
            return {
                cnt[pos][prev2][prev1][started],
                dp[pos][prev2][prev1][started]
            };
        }

        int limit = tight ? s[pos] - '0' : 9;

        long long ways = 0;
        long long waves = 0;

        for (int d = 0; d <= limit; d++) {
            bool ntight = tight && (d == limit);

            if (!started && d == 0) {
                auto [c, w] = dfs(pos + 1, 10, 10, false, ntight);
                ways += c;
                waves += w;
            } else {
                auto [c, w] = dfs(
                    pos + 1,
                    prev1,
                    d,
                    true,
                    ntight
                );

                long long add = 0;

                if (started && prev2 != 10) {
                    if ((prev1 > prev2 && prev1 > d) ||
                        (prev1 < prev2 && prev1 < d)) {
                        add = c;
                    }
                }

                ways += c;
                waves += w + add;
            }
        }

        if (!tight) {
            cnt[pos][prev2][prev1][started] = ways;
            dp[pos][prev2][prev1][started] = waves;
        }

        return {ways, waves};
    }

    long long solve(long long x) {
        if (x <= 0) return 0;

        s = to_string(x);

        memset(dp, -1, sizeof(dp));
        memset(cnt, 0, sizeof(cnt));

        return dfs(0, 10, 10, false, true).second;
    }

    long long totalWaviness(long long num1, long long num2) {
        return solve(num2) - solve(num1 - 1);
    }
};