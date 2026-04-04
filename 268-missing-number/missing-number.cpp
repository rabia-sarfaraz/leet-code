class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int n = nums.size();
        int xorVal = n;

        for (int i = 0; i < n; i++) {
            xorVal ^= i ^ nums[i];
        }

        return xorVal;
    }
};