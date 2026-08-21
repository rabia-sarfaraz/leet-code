class Solution {
public:
    string reformatNumber(string number) {
        string s = "";

        // Sirf digits rakho
        for (char c : number) {
            if (isdigit(c)) {
                s += c;
            }
        }

        string ans;
        int n = s.size();
        int i = 0;

        // Jab 4 se zyada digits remaining hon
        while (n - i > 4) {
            ans += s.substr(i, 3);
            ans += "-";
            i += 3;
        }

        // Last 4 digits ko 2-2 mein divide karo
        if (n - i == 4) {
            ans += s.substr(i, 2);
            ans += "-";
            ans += s.substr(i + 2, 2);
        }
        else {
            ans += s.substr(i);
        }

        return ans;
    }
};