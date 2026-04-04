class Solution {
public:
    vector<vector<string>> findLadders(string beginWord, string endWord, vector<string>& wordList) {
        unordered_set<string> dict(wordList.begin(), wordList.end());
        vector<vector<string>> result;

        if (!dict.count(endWord)) return result;

        unordered_map<string, vector<string>> parents;
        unordered_set<string> current;
        current.insert(beginWord);

        bool found = false;

        while (!current.empty() && !found) {
            for (auto &w : current) dict.erase(w);

            unordered_set<string> nextLevel;

            for (auto &word : current) {
                string temp = word;

                for (int i = 0; i < temp.size(); i++) {
                    char original = temp[i];

                    for (char c = 'a'; c <= 'z'; c++) {
                        temp[i] = c;

                        if (!dict.count(temp)) continue;

                        nextLevel.insert(temp);
                        parents[temp].push_back(word);

                        if (temp == endWord) found = true;
                    }

                    temp[i] = original;
                }
            }

            current = nextLevel;
        }

        // ✅ IMPORTANT: ensure return always happens
        if (!found) return result;

        vector<string> path;

        function<void(string)> dfs = [&](string word) {
            path.push_back(word);

            if (word == beginWord) {
                vector<string> temp = path;
                reverse(temp.begin(), temp.end());
                result.push_back(temp);
            } else {
                for (auto &p : parents[word]) {
                    dfs(p);
                }
            }

            path.pop_back();
        };

        dfs(endWord);

        return result; // ✅ final return (fixes your error)
    }
};