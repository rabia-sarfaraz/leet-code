class Solution {
public:
    bool checkIfExist(vector<int>& arr) {
        unordered_set<int> s;

        for (int x : arr) {
            // check double
            if (s.count(2 * x)) return true;

            // check half (only if even)
            if (x % 2 == 0 && s.count(x / 2)) return true;

            s.insert(x);
        }

        return false;
    }
};