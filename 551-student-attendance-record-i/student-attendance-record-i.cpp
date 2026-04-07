class Solution {
public:
    bool checkRecord(string s) {
        int absents = 0;
        int lateStreak = 0;

        for (char c : s) {
            if (c == 'A') {
                absents++;
                lateStreak = 0;
                if (absents > 1) return false;
            }
            else if (c == 'L') {
                lateStreak++;
                if (lateStreak > 2) return false;
            }
            else {
                lateStreak = 0;
            }
        }

        return true;
    }
};