class Solution {
public:
    double average(vector<int>& salary) {
        int mn = INT_MAX;
        int mx = INT_MIN;
        int sum = 0;

        for (int s : salary) {
            mn = min(mn, s);
            mx = max(mx, s);
            sum += s;
        }

        return (double)(sum - mn - mx) / (salary.size() - 2);
    }
};