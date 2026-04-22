class TweetCounts {
  Map<String, List<int>> tweets = {};

  TweetCounts();

  void recordTweet(String tweetName, int time) {
    tweets.putIfAbsent(tweetName, () => []);
    tweets[tweetName]!.add(time);
  }

  List<int> getTweetCountsPerFrequency(
      String freq, String tweetName, int startTime, int endTime) {

    int interval;
    if (freq == "minute") {
      interval = 60;
    } else if (freq == "hour") {
      interval = 3600;
    } else {
      interval = 86400;
    }

    int size = ((endTime - startTime) ~/ interval) + 1;
    List<int> result = List.filled(size, 0);

    if (!tweets.containsKey(tweetName)) return result;

    for (int time in tweets[tweetName]!) {
      if (time < startTime || time > endTime) continue;

      int index = (time - startTime) ~/ interval;
      result[index]++;
    }

    return result;
  }
}