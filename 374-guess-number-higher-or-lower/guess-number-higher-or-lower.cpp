class Solution {
public:
    int guessNumber(int n) {
        long left = 1, right = n;

        while (left <= right) {
            long mid = left + (right - left) / 2;

            int res = guess(mid);

            if (res == 0) {
                return mid;
            } else if (res == -1) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }

        return -1; // should never reach here
    }
};