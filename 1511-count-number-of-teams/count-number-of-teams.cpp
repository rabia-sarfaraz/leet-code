class Solution {
public:
    int numTeams(vector<int>& rating) {
        int n = rating.size();
        int count = 0;

        for (int j = 0; j < n; j++) {
            int leftSmall = 0, leftGreater = 0;
            int rightSmall = 0, rightGreater = 0;

            // left side
            for (int i = 0; i < j; i++) {
                if (rating[i] < rating[j]) leftSmall++;
                else if (rating[i] > rating[j]) leftGreater++;
            }

            // right side
            for (int k = j + 1; k < n; k++) {
                if (rating[k] > rating[j]) rightGreater++;
                else if (rating[k] < rating[j]) rightSmall++;
            }

            count += leftSmall * rightGreater + leftGreater * rightSmall;
        }

        return count;
    }
};