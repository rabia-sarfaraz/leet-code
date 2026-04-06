class Solution {
public:

    bool isUniform(vector<vector<int>>& grid, int r1, int c1, int r2, int c2) {
        int val = grid[r1][c1];

        for (int i = r1; i < r2; i++) {
            for (int j = c1; j < c2; j++) {
                if (grid[i][j] != val) return false;
            }
        }
        return true;
    }

    Node* build(vector<vector<int>>& grid, int r1, int c1, int r2, int c2) {

        if (isUniform(grid, r1, c1, r2, c2)) {
            return new Node(grid[r1][c1] == 1, true);
        }

        Node* node = new Node(true, false);

        int rm = (r1 + r2) / 2;
        int cm = (c1 + c2) / 2;

        node->topLeft = build(grid, r1, c1, rm, cm);
        node->topRight = build(grid, r1, cm, rm, c2);
        node->bottomLeft = build(grid, rm, c1, r2, cm);
        node->bottomRight = build(grid, rm, cm, r2, c2);

        return node;
    }

    Node* construct(vector<vector<int>>& grid) {
        int n = grid.size();
        return build(grid, 0, 0, n, n);
    }
};