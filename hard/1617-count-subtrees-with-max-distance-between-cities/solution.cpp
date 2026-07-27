class Solution {
public:
    vector<int> countSubgraphsForEachDiameter(int n, vector<vector<int>>& edges) {
        vector<vector<int>> g(n);
        for (auto &e : edges) {
            int u = e[0] - 1;
            int v = e[1] - 1;
            g[u].push_back(v);
            g[v].push_back(u);
        }

        vector<int> ans(n - 1);

        for (int mask = 1; mask < (1 << n); mask++) {
            if (__builtin_popcount(mask) < 2) continue;

            int start = __builtin_ctz(mask);

            auto first = bfs(start, mask, g);
            if (first.visited != __builtin_popcount(mask)) continue;

            auto second = bfs(first.node, mask, g);
            if (second.dist > 0)
                ans[second.dist - 1]++;
        }

        return ans;
    }

private:
    struct Result {
        int node;
        int dist;
        int visited;
    };

    Result bfs(int start, int mask, vector<vector<int>>& g) {
        int n = g.size();
        vector<int> dist(n, -1);
        queue<int> q;

        q.push(start);
        dist[start] = 0;

        int far = start;
        int visited = 0;

        while (!q.empty()) {
            int u = q.front();
            q.pop();
            visited++;

            if (dist[u] > dist[far]) far = u;

            for (int v : g[u]) {
                if ((mask & (1 << v)) && dist[v] == -1) {
                    dist[v] = dist[u] + 1;
                    q.push(v);
                }
            }
        }

        return {far, dist[far], visited};
    }
};