class Solution {
public:
    bool isPowerOfFour(int n) {
        if (n <= 0) return false;

        // check power of 2
        if (n & (n - 1)) return false;

        // check even position bit (power of 4)
        return (n & 0x55555555) != 0;
    }
};