class Solution {
  late int k;
  late int n;
  late List<Node> tree;

  List<int> resultArray(
    List<int> nums,
    int k,
    List<List<int>> queries,
  ) {
    this.k = k;
    n = nums.length;

    tree = List.generate(4 * n, (_) => Node(k));

    _build(1, 0, n - 1, nums);

    List<int> ans = [];

    for (final q in queries) {
      int index = q[0];
      int value = q[1];
      int start = q[2];
      int x = q[3];

      // Update
      _update(1, 0, n - 1, index, value);

      // Query [start, n-1]
      Node res = _query(1, 0, n - 1, start, n - 1);

      ans.add(res.cnt[x]);
    }

    return ans;
  }

  void _build(int node, int left, int right, List<int> nums) {
    if (left == right) {
      int value = nums[left] % k;
      tree[node].prod = value;
      tree[node].cnt[value] = 1;
      return;
    }

    int mid = (left + right) ~/ 2;

    _build(node * 2, left, mid, nums);
    _build(node * 2 + 1, mid + 1, right, nums);

    tree[node] = _merge(tree[node * 2], tree[node * 2 + 1]);
  }

  void _update(
    int node,
    int left,
    int right,
    int index,
    int value,
  ) {
    if (left == right) {
      int v = value % k;

      tree[node] = Node(k);
      tree[node].prod = v;
      tree[node].cnt[v] = 1;

      return;
    }

    int mid = (left + right) ~/ 2;

    if (index <= mid) {
      _update(node * 2, left, mid, index, value);
    } else {
      _update(node * 2 + 1, mid + 1, right, index, value);
    }

    tree[node] = _merge(tree[node * 2], tree[node * 2 + 1]);
  }

  Node _query(
    int node,
    int left,
    int right,
    int ql,
    int qr,
  ) {
    if (ql <= left && right <= qr) {
      return tree[node];
    }

    int mid = (left + right) ~/ 2;

    if (qr <= mid) {
      return _query(node * 2, left, mid, ql, qr);
    }

    if (ql > mid) {
      return _query(node * 2 + 1, mid + 1, right, ql, qr);
    }

    Node leftNode =
        _query(node * 2, left, mid, ql, qr);

    Node rightNode =
        _query(node * 2 + 1, mid + 1, right, ql, qr);

    return _merge(leftNode, rightNode);
  }

  Node _merge(Node a, Node b) {
    Node res = Node(k);

    res.prod = (a.prod * b.prod) % k;

    // Prefixes completely inside left part
    for (int r = 0; r < k; r++) {
      res.cnt[r] += a.cnt[r];
    }

    // Prefixes that cross into right part
    for (int r = 0; r < k; r++) {
      int newRemainder = (a.prod * r) % k;
      res.cnt[newRemainder] += b.cnt[r];
    }

    return res;
  }
}

class Node {
  int prod = 1;
  late List<int> cnt;

  Node(int k) {
    cnt = List.filled(k, 0);
  }
}