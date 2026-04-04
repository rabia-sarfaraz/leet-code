class Solution {
public:
    vector<vector<int>> getSkyline(vector<vector<int>>& buildings) {
        vector<pair<int,int>> events;

        // Step 1: create events
        for (auto &b : buildings) {
            int l = b[0], r = b[1], h = b[2];
            events.push_back({l, -h}); // start
            events.push_back({r, h});  // end
        }

        // Step 2: sort events
        sort(events.begin(), events.end());

        // Step 3: max heap + lazy deletion
        priority_queue<int> pq;
        unordered_map<int, int> count;

        pq.push(0);
        count[0] = 1;

        auto remove = [&](int h) {
            count[h]--;
        };

        auto clean = [&]() {
            while (!pq.empty() && count[pq.top()] == 0) {
                pq.pop();
            }
        };

        vector<vector<int>> result;
        int prevMax = 0;

        for (auto &e : events) {
            int x = e.first;
            int h = e.second;

            if (h < 0) {
                // start building
                count[-h]++;
                pq.push(-h);
            } else {
                // end building
                remove(h);
            }

            clean();
            int currMax = pq.top();

            if (currMax != prevMax) {
                result.push_back({x, currMax});
                prevMax = currMax;
            }
        }

        return result;
    }
};