class Solution {
public:
    vector<string> printVertically(string s) {
        vector<string> words;
        string temp;
        
        // Step 1: split words
        for (char c : s) {
            if (c == ' ') {
                words.push_back(temp);
                temp = "";
            } else {
                temp += c;
            }
        }
        words.push_back(temp);

        // Step 2: find max length
        int maxLen = 0;
        for (auto &w : words) {
            maxLen = max(maxLen, (int)w.size());
        }

        vector<string> result;

        // Step 3: build vertical strings
        for (int i = 0; i < maxLen; i++) {
            string line = "";
            for (auto &w : words) {
                if (i < w.size()) {
                    line += w[i];
                } else {
                    line += ' ';
                }
            }

            // Step 4: remove trailing spaces
            while (!line.empty() && line.back() == ' ') {
                line.pop_back();
            }

            result.push_back(line);
        }

        return result;
    }
};