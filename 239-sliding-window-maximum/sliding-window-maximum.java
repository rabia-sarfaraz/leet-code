class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        if (nums == null || nums.length == 0) return new int[0];

        int n = nums.length;
        int[] result = new int[n - k + 1];
        int ri = 0;

        java.util.Deque<Integer> dq = new java.util.ArrayDeque<>();

        for (int i = 0; i < n; i++) {

            // remove out of window indices
            if (!dq.isEmpty() && dq.peekFirst() <= i - k) {
                dq.pollFirst();
            }

            // remove smaller values from back
            while (!dq.isEmpty() && nums[dq.peekLast()] < nums[i]) {
                dq.pollLast();
            }

            dq.offerLast(i);

            // start adding to result
            if (i >= k - 1) {
                result[ri++] = nums[dq.peekFirst()];
            }
        }

        return result;
    }
}