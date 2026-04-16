class Solution {
public:
    int f(string s) {
        char minChar = 'z';
        int count = 0;

        for (char c : s) {
            if (c < minChar) {
                minChar = c;
                count = 1;
            } else if (c == minChar) {
                count++;
            }
        }
        return count;
    }

    vector<int> numSmallerByFrequency(vector<string>& queries, vector<string>& words) {
        vector<int> wf;

        for (string &w : words) {
            wf.push_back(f(w));
        }

        sort(wf.begin(), wf.end());

        vector<int> res;

        for (string &q : queries) {
            int fq = f(q);

            // count words > fq using upper_bound
            int idx = upper_bound(wf.begin(), wf.end(), fq) - wf.begin();

            res.push_back(wf.size() - idx);
        }

        return res;
    }
};