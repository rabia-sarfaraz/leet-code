class Solution {
public:
    vector<vector<int>> palindromePairs(vector<string>& words) {
        unordered_map<string, int> mp;

        for (int i = 0; i < words.size(); i++) {
            mp[words[i]] = i;
        }

        vector<vector<int>> res;

        for (int i = 0; i < words.size(); i++) {
            string word = words[i];
            int n = word.size();

            for (int j = 0; j <= n; j++) {
                string left = word.substr(0, j);
                string right = word.substr(j);

                // Case 1: left is palindrome, check reverse(right)
                if (isPalindrome(left)) {
                    string revRight = reverseStr(right);
                    if (mp.count(revRight) && mp[revRight] != i) {
                        res.push_back({mp[revRight], i});
                    }
                }

                // Case 2: right is palindrome, check reverse(left)
                if (j != n && isPalindrome(right)) {
                    string revLeft = reverseStr(left);
                    if (mp.count(revLeft) && mp[revLeft] != i) {
                        res.push_back({i, mp[revLeft]});
                    }
                }
            }
        }

        return res;
    }

private:
    bool isPalindrome(const string &s) {
        int l = 0, r = s.size() - 1;
        while (l < r) {
            if (s[l++] != s[r--]) return false;
        }
        return true;
    }

    string reverseStr(string s) {
        reverse(s.begin(), s.end());
        return s;
    }
};