class Twitter {
  int time = 0;

  Map<int, Set<int>> follows = {};
  Map<int, List<List<int>>> tweets = {};
  // tweets[user] = [[time, tweetId], ...]

  Twitter() {}

  void postTweet(int userId, int tweetId) {
    tweets.putIfAbsent(userId, () => []);
    tweets[userId]!.add([time, tweetId]);
    time++;
  }

  List<int> getNewsFeed(int userId) {
    List<int> result = [];

    Set<int> users = {userId};
    if (follows.containsKey(userId)) {
      users.addAll(follows[userId]!);
    }

    List<List<int>> allTweets = [];

    for (int u in users) {
      if (tweets.containsKey(u)) {
        allTweets.addAll(tweets[u]!);
      }
    }

    allTweets.sort((a, b) => b[0].compareTo(a[0]));

    for (int i = 0; i < allTweets.length && i < 10; i++) {
      result.add(allTweets[i][1]);
    }

    return result;
  }

  void follow(int followerId, int followeeId) {
    follows.putIfAbsent(followerId, () => {});
    follows[followerId]!.add(followeeId);
  }

  void unfollow(int followerId, int followeeId) {
    if (follows.containsKey(followerId)) {
      follows[followerId]!.remove(followeeId);
    }
  }
}