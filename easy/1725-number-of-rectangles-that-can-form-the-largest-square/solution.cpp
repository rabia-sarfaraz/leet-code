class Solution {
public:
    int countGoodRectangles(vector<vector<int>>& rectangles) {
        int maxSide = 0;
        int count = 0;

        for (auto &r : rectangles) {
            int side = min(r[0], r[1]);

            if (side > maxSide) {
                maxSide = side;
                count = 1;
            }
            else if (side == maxSide) {
                count++;
            }
        }

        return count;
    }
};