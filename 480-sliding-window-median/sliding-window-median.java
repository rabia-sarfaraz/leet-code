import java.util.*;

class Solution {

    PriorityQueue<Integer> small = new PriorityQueue<>(Collections.reverseOrder()); // max heap
    PriorityQueue<Integer> large = new PriorityQueue<>(); // min heap

    Map<Integer, Integer> delayed = new HashMap<>();

    int smallSize = 0, largeSize = 0;

    public double[] medianSlidingWindow(int[] nums, int k) {
        int n = nums.length;
        double[] res = new double[n - k + 1];
        int idx = 0;

        for (int i = 0; i < n; i++) {
            add(nums[i]);

            if (i >= k) {
                remove(nums[i - k]);
            }

            if (i >= k - 1) {
                res[idx++] = getMedian(k);
            }
        }

        return res;
    }

    private void add(int num) {
        if (small.isEmpty() || num <= small.peek()) {
            small.offer(num);
            smallSize++;
        } else {
            large.offer(num);
            largeSize++;
        }
        balance();
    }

    private void remove(int num) {
        delayed.put(num, delayed.getOrDefault(num, 0) + 1);

        if (!small.isEmpty() && num <= small.peek()) {
            smallSize--;
            if (num == small.peek()) prune(small);
        } else {
            largeSize--;
            if (!large.isEmpty() && num == large.peek()) prune(large);
        }

        balance();
    }

    private void balance() {
        if (smallSize > largeSize + 1) {
            large.offer(small.poll());
            smallSize--;
            largeSize++;
            prune(small);
        } else if (smallSize < largeSize) {
            small.offer(large.poll());
            largeSize--;
            smallSize++;
            prune(large);
        }
    }

    private void prune(PriorityQueue<Integer> heap) {
        while (!heap.isEmpty()) {
            int num = heap.peek();
            if (delayed.containsKey(num)) {
                delayed.put(num, delayed.get(num) - 1);
                if (delayed.get(num) == 0) delayed.remove(num);
                heap.poll();
            } else {
                break;
            }
        }
    }

    private double getMedian(int k) {
        if (k % 2 == 1) {
            return small.peek();
        } else {
            return ((long) small.peek() + (long) large.peek()) / 2.0;
        }
    }
}