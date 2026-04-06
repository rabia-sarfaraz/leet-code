class Solution {
public:
    vector<vector<int>> kSmallestPairs(vector<int>& nums1, vector<int>& nums2, int k) {
        vector<vector<int>> result;

        if (nums1.empty() || nums2.empty() || k == 0) return result;

        // min heap: {sum, i, j}
        priority_queue<
            vector<int>,
            vector<vector<int>>,
            greater<vector<int>>
        > pq;

        // push initial pairs
        for (int i = 0; i < nums1.size() && i < k; i++) {
            pq.push({nums1[i] + nums2[0], i, 0});
        }

        while (!pq.empty() && result.size() < k) {
            auto top = pq.top();
            pq.pop();

            int i = top[1];
            int j = top[2];

            result.push_back({nums1[i], nums2[j]});

            if (j + 1 < nums2.size()) {
                pq.push({nums1[i] + nums2[j + 1], i, j + 1});
            }
        }

        return result;
    }
};