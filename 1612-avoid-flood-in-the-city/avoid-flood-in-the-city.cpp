class Solution {
public:
    vector<int> avoidFlood(vector<int>& rains) {
        int n = rains.size();

        vector<int> ans(n, 1);

        unordered_map<int, int> fullLake;
        set<int> dryDays;

        for (int i = 0; i < n; i++) {

            // Dry day
            if (rains[i] == 0) {
                dryDays.insert(i);
            }

            // Rain day
            else {
                int lake = rains[i];

                ans[i] = -1;

                // Lake already full -> must dry before today
                if (fullLake.count(lake)) {

                    auto it = dryDays.upper_bound(fullLake[lake]);

                    // No available dry day
                    if (it == dryDays.end()) {
                        return {};
                    }

                    ans[*it] = lake;
                    dryDays.erase(it);
                }

                fullLake[lake] = i;
            }
        }

        return ans;
    }
};