class Solution {
public:
    int findMinArrowShots(vector<vector<int>>& points) {
        if (points.empty()) return 0;

        // Step 1: sort by end
        sort(points.begin(), points.end(), [](auto &a, auto &b) {
            return a[1] < b[1];
        });

        int arrows = 1;
        int lastEnd = points[0][1];

        // Step 2: iterate
        for (int i = 1; i < points.size(); i++) {
            if (points[i][0] > lastEnd) {
                arrows++;
                lastEnd = points[i][1];
            }
        }

        return arrows;
    }
};