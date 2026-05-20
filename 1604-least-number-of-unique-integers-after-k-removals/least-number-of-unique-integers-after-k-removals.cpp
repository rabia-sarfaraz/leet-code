class Solution {
public:
    int findLeastNumOfUniqueInts(vector<int>& arr, int k) {
        unordered_map<int, int> freq;

        // Count frequency
        for (int num : arr) {
            freq[num]++;
        }

        // Store frequencies
        vector<int> counts;
        for (auto &p : freq) {
            counts.push_back(p.second);
        }

        // Remove smallest frequencies first
        sort(counts.begin(), counts.end());

        int unique = counts.size();

        for (int cnt : counts) {
            if (k >= cnt) {
                k -= cnt;
                unique--;
            } else {
                break;
            }
        }

        return unique;
    }
};