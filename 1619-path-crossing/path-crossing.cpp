class Solution {
public:
    bool isPathCrossing(string path) {
        set<pair<int, int>> visited;

        int x = 0;
        int y = 0;

        visited.insert({0, 0});

        for (char ch : path) {

            if (ch == 'N') y++;
            else if (ch == 'S') y--;
            else if (ch == 'E') x++;
            else x--;

            // Already visited
            if (visited.count({x, y})) {
                return true;
            }

            visited.insert({x, y});
        }

        return false;
    }
};