class Solution {
public:
    string strWithout3a3b(int a, int b) {
        string res = "";

        while (a > 0 || b > 0) {
            int n = res.size();

            // If last two are "aa", we must add 'b'
            if (n >= 2 && res[n - 1] == 'a' && res[n - 2] == 'a') {
                if (b == 0) break;
                res.push_back('b');
                b--;
            }
            // If last two are "bb", we must add 'a'
            else if (n >= 2 && res[n - 1] == 'b' && res[n - 2] == 'b') {
                if (a == 0) break;
                res.push_back('a');
                a--;
            }
            // Otherwise take the bigger count
            else {
                if (a >= b && a > 0) {
                    res.push_back('a');
                    a--;
                } else if (b > 0) {
                    res.push_back('b');
                    b--;
                }
            }
        }

        return res;
    }
};