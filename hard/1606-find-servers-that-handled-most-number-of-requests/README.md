# Find Servers That Handled Most Number of Requests

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You have `k` servers numbered from `0` to `k-1` that are being used to handle multiple requests simultaneously. Each server has infinite computational capacity but **cannot handle more than one request at a time**. The requests are assigned to servers according to a specific algorithm:

- The ith (0-indexed) request arrives.
- If all servers are busy, the request is dropped (not handled at all).
- If the (i % k)th server is available, assign the request to that server.
- Otherwise, assign the request to the next available server (wrapping around the list of servers and starting from 0 if necessary). For example, if the ith server is busy, try to assign the request to the (i+1)th server, then the (i+2)th server, and so on.

You are given a **strictly increasing** array `arrival` of positive integers, where `arrival[i]` represents the arrival time of the `ith` request, and another array `load`, where `load[i]` represents the load of the `ith` request (the time it takes to complete). Your goal is to find the **busiest server(s)**. A server is considered **busiest** if it handled the most number of requests successfully among all the servers.

Return *a list containing the IDs (0-indexed) of the **busiest server(s)***. You may return the IDs in any order.

 

**Example 1:**

```
Input: k = 3, arrival = [1,2,3,4,5], load = [5,2,3,3,3] 
Output: [1] 
Explanation: 
All of the servers start out available.
The first 3 requests are handled by the first 3 servers in order.
Request 3 comes in. Server 0 is busy, so it's assigned to the next available server, which is 1.
Request 4 comes in. It cannot be handled since all servers are busy, so it is dropped.
Servers 0 and 2 handled one request each, while server 1 handled two requests. Hence server 1 is the busiest server.

```

**Example 2:**

```
Input: k = 3, arrival = [1,2,3,4], load = [1,2,1,2]
Output: [0]
Explanation: 
The first 3 requests are handled by first 3 servers.
Request 3 comes in. It is handled by server 0 since the server is available.
Server 0 handled two requests, while servers 1 and 2 handled one request each. Hence server 0 is the busiest server.

```

**Example 3:**

```
Input: k = 3, arrival = [1,2,3], load = [10,12,11]
Output: [0,1,2]
Explanation: Each server handles a single request, so they are all considered the busiest.

```

 

**Constraints:**

- 1 <= k <= 105
- 1 <= arrival.length, load.length <= 105
- arrival.length == load.length
- 1 <= arrival[i], load[i] <= 109
- arrival is strictly increasing.

## Solution

**Language:** dart  
**Runtime:** 180 ms (beats 100.00%)  
**Memory:** 192.3 MB (beats 100.00%)  
**Submitted:** 2026-11-09T05:15:41.851Z  

```dart
class Solution {
  List<int> busiestServers(
      int k, List<int> arrival, List<int> load) {

    List<int> count = List.filled(k, 0);

    // Segment Tree
    List<int> tree = List.filled(4 * k, 0);

    void build(int node, int left, int right) {
      if (left == right) {
        tree[node] = 1;
        return;
      }

      int mid = (left + right) ~/ 2;

      build(node * 2, left, mid);
      build(node * 2 + 1, mid + 1, right);

      tree[node] = tree[node * 2] + tree[node * 2 + 1];
    }

    void update(int node, int left, int right, int index, int value) {
      if (left == right) {
        tree[node] = value;
        return;
      }

      int mid = (left + right) ~/ 2;

      if (index <= mid) {
        update(node * 2, left, mid, index, value);
      } else {
        update(node * 2 + 1, mid + 1, right, index, value);
      }

      tree[node] = tree[node * 2] + tree[node * 2 + 1];
    }

    int findFirst(int node, int left, int right, int ql, int qr) {
      if (ql > qr || right < ql || left > qr || tree[node] == 0) {
        return -1;
      }

      if (left == right) return left;

      int mid = (left + right) ~/ 2;

      int result = findFirst(node * 2, left, mid, ql, qr);

      if (result != -1) return result;

      return findFirst(node * 2 + 1, mid + 1, right, ql, qr);
    }

    // Min Heap
    List<int> heapEnd = [];
    List<int> heapServer = [];

    void heapPush(int end, int server) {
      heapEnd.add(end);
      heapServer.add(server);

      int i = heapEnd.length - 1;

      while (i > 0) {
        int p = (i - 1) ~/ 2;

        if (heapEnd[p] <= heapEnd[i]) break;

        int temp = heapEnd[p];
        heapEnd[p] = heapEnd[i];
        heapEnd[i] = temp;

        temp = heapServer[p];
        heapServer[p] = heapServer[i];
        heapServer[i] = temp;

        i = p;
      }
    }

    List<int> heapPop() {
      int end = heapEnd[0];
      int server = heapServer[0];

      int lastEnd = heapEnd.removeLast();
      int lastServer = heapServer.removeLast();

      if (heapEnd.isNotEmpty) {
        heapEnd[0] = lastEnd;
        heapServer[0] = lastServer;

        int i = 0;

        while (true) {
          int smallest = i;
          int l = i * 2 + 1;
          int r = i * 2 + 2;

          if (l < heapEnd.length &&
              heapEnd[l] < heapEnd[smallest]) {
            smallest = l;
          }

          if (r < heapEnd.length &&
              heapEnd[r] < heapEnd[smallest]) {
            smallest = r;
          }

          if (smallest == i) break;

          int temp = heapEnd[i];
          heapEnd[i] = heapEnd[smallest];
          heapEnd[smallest] = temp;

          temp = heapServer[i];
          heapServer[i] = heapServer[smallest];
          heapServer[smallest] = temp;

          i = smallest;
        }
      }

      return [end, server];
    }

    build(1, 0, k - 1);

    for (int i = 0; i < arrival.length; i++) {
      int time = arrival[i];

      // Release completed servers
      while (heapEnd.isNotEmpty && heapEnd[0] <= time) {
        List<int> item = heapPop();
        update(1, 0, k - 1, item[1], 1);
      }

      int preferred = i % k;

      int server = findFirst(1, 0, k - 1, preferred, k - 1);

      if (server == -1) {
        server = findFirst(1, 0, k - 1, 0, preferred - 1);
      }

      if (server == -1) continue;

      count[server]++;

      update(1, 0, k - 1, server, 0);

      heapPush(time + load[i], server);
    }

    // Return busiest servers
    int maxCount = count.reduce((a, b) => a > b ? a : b);

    List<int> answer = [];

    for (int i = 0; i < k; i++) {
      if (count[i] == maxCount) {
        answer.add(i);
      }
    }

    return answer;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/find-servers-that-handled-most-number-of-requests/)