class Solution {
public:
    vector<int> numberOfLines(vector<int>& widths, string s) {
        int lines = 1;
        int currentWidth = 0;

        for (char c : s) {
            int w = widths[c - 'a'];

            if (currentWidth + w > 100) {
                lines++;
                currentWidth = w;
            } else {
                currentWidth += w;
            }
        }

        return {lines, currentWidth};
    }
};