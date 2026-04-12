class RecentCounter {
  List<int> q = [];

  RecentCounter();

  int ping(int t) {
    q.add(t);

    // remove all times older than t - 3000
    while (q.isNotEmpty && q.first < t - 3000) {
      q.removeAt(0);
    }

    return q.length;
  }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * RecentCounter obj = RecentCounter();
 * int param1 = obj.ping(t);
 */