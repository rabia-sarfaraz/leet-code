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