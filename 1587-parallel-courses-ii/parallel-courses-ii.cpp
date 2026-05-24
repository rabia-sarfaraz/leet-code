class Solution {
public:
    int minNumberOfSemesters(int n, vector<vector<int>>& relations, int k) {

        vector<int> prereq(n, 0);

        // Build prerequisite mask
        for (auto &r : relations) {
            int u = r[0] - 1;
            int v = r[1] - 1;

            prereq[v] |= (1 << u);
        }

        int totalMask = 1 << n;

        vector<int> dist(totalMask, 1e9);

        queue<int> q;

        dist[0] = 0;
        q.push(0);

        while (!q.empty()) {

            int mask = q.front();
            q.pop();

            // All courses completed
            if (mask == totalMask - 1) {
                return dist[mask];
            }

            int available = 0;

            // Find available courses
            for (int i = 0; i < n; i++) {

                if ((mask & (1 << i)) == 0 &&
                    (prereq[i] & mask) == prereq[i]) {

                    available |= (1 << i);
                }
            }

            vector<int> subsets;

            // If available count <= k
            if (__builtin_popcount(available) <= k) {
                subsets.push_back(available);
            }
            else {

                // Generate subsets of size k
                for (int sub = available; sub; sub = (sub - 1) & available) {

                    if (__builtin_popcount(sub) == k) {
                        subsets.push_back(sub);
                    }
                }
            }

            // Try all choices
            for (int sub : subsets) {

                int nextMask = mask | sub;

                if (dist[nextMask] > dist[mask] + 1) {

                    dist[nextMask] = dist[mask] + 1;

                    q.push(nextMask);
                }
            }
        }

        return -1;
    }
};