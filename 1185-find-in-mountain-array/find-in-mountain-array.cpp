class Solution {
public:
    int findPeak(MountainArray &arr) {
        int low = 0, high = arr.length() - 1;
        
        while (low < high) {
            int mid = low + (high - low) / 2;
            
            if (arr.get(mid) < arr.get(mid + 1)) {
                low = mid + 1; // peak right side
            } else {
                high = mid; // peak left side ya mid
            }
        }
        return low;
    }
    
    int binarySearch(MountainArray &arr, int target, int low, int high, bool asc) {
        while (low <= high) {
            int mid = low + (high - low) / 2;
            int val = arr.get(mid);
            
            if (val == target) return mid;
            
            if (asc) {
                if (val < target) low = mid + 1;
                else high = mid - 1;
            } else {
                if (val < target) high = mid - 1;
                else low = mid + 1;
            }
        }
        return -1;
    }
    
    int findInMountainArray(int target, MountainArray &mountainArr) {
        int peak = findPeak(mountainArr);
        
        // Left side (ascending)
        int left = binarySearch(mountainArr, target, 0, peak, true);
        if (left != -1) return left;
        
        // Right side (descending)
        return binarySearch(mountainArr, target, peak + 1, mountainArr.length() - 1, false);
    }
};