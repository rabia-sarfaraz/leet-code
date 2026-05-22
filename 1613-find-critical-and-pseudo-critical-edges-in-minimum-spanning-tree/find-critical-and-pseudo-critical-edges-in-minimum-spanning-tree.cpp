class DSU {
public:
    vector<int> parent, rank;

    DSU(int n) {
        parent.resize(n);
        rank.resize(n, 0);

        for (int i = 0; i < n; i++) {
            parent[i] = i;
        }
    }

    int find(int x) {
        if (parent[x] != x) {
            parent[x] = find(parent[x]);
        }

        return parent[x];
    }

    bool unite(int x, int y) {
        int px = find(x);
        int py = find(y);

        if (px == py) return false;

        if (rank[px] < rank[py]) {
            swap(px, py);
        }

        parent[py] = px;

        if (rank[px] == rank[py]) {
            rank[px]++;
        }

        return true;
    }
};

class Solution {
public:

    int kruskal(
        int n,
        vector<vector<int>>& edges,
        int skipEdge,
        int forceEdge
    ) {
        DSU dsu(n);

        int weight = 0;
        int used = 0;

        // Force include edge
        if (forceEdge != -1) {
            auto &e = edges[forceEdge];

            if (dsu.unite(e[0], e[1])) {
                weight += e[2];
                used++;
            }
        }

        for (int i = 0; i < edges.size(); i++) {

            if (i == skipEdge) continue;

            auto &e = edges[i];

            if (dsu.unite(e[0], e[1])) {
                weight += e[2];
                used++;
            }
        }

        // Not MST
        if (used != n - 1) {
            return 1e9;
        }

        return weight;
    }

    vector<vector<int>> findCriticalAndPseudoCriticalEdges(
        int n,
        vector<vector<int>>& edges
    ) {

        int m = edges.size();

        // Store original indices
        for (int i = 0; i < m; i++) {
            edges[i].push_back(i);
        }

        sort(edges.begin(), edges.end(),
            [](auto &a, auto &b) {
                return a[2] < b[2];
            });

        int mstWeight = kruskal(n, edges, -1, -1);

        vector<int> critical;
        vector<int> pseudo;

        for (int i = 0; i < m; i++) {

            // If skipping increases MST weight
            if (kruskal(n, edges, i, -1) > mstWeight) {
                critical.push_back(edges[i][3]);
            }

            // If forcing still gives same MST weight
            else if (kruskal(n, edges, -1, i) == mstWeight) {
                pseudo.push_back(edges[i][3]);
            }
        }

        return {critical, pseudo};
    }
};