class Solution {
public:
    vector<int> parent;

    int find(int x) {
        if (parent[x] != x)
            parent[x] = find(parent[x]); // path compression
        return parent[x];
    }

    void unite(int x, int y) {
        parent[find(x)] = find(y);
    }

    int minimumHammingDistance(vector<int>& source, vector<int>& target, vector<vector<int>>& allowedSwaps) {
        int n = source.size();
        parent.resize(n);

        // Initialize DSU
        for (int i = 0; i < n; i++) parent[i] = i;

        // Union allowed swaps
        for (auto &swap : allowedSwaps) {
            unite(swap[0], swap[1]);
        }

        // Group indices by root
        unordered_map<int, vector<int>> groups;
        for (int i = 0; i < n; i++) {
            groups[find(i)].push_back(i);
        }

        int result = 0;

        // Process each group
        for (auto &g : groups) {
            unordered_map<int, int> freq;

            // Count source values
            for (int idx : g.second) {
                freq[source[idx]]++;
            }

            // Try matching with target
            for (int idx : g.second) {
                if (freq[target[idx]] > 0) {
                    freq[target[idx]]--;
                } else {
                    result++; // mismatch
                }
            }
        }

        return result;
    }
};