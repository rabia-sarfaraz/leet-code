class Solution {
public:
    bool canArrange(vector<int>& arr, int k) {
        vector<int> rem(k, 0);

        // Count remainders
        for (int num : arr) {
            int r = ((num % k) + k) % k;
            rem[r]++;
        }

        // Remainder 0 must be even
        if (rem[0] % 2 != 0) {
            return false;
        }

        // Check complementary remainders
        for (int i = 1; i < k; i++) {
            if (rem[i] != rem[k - i]) {
                return false;
            }
        }

        return true;
    }
};