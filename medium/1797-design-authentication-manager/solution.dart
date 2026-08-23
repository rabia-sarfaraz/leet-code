class AuthenticationManager {
  final int timeToLive;
  final Map<String, int> tokens = {};

  AuthenticationManager(this.timeToLive);

  void generate(String tokenId, int currentTime) {
    tokens[tokenId] = currentTime + timeToLive;
  }

  void renew(String tokenId, int currentTime) {
    if (!tokens.containsKey(tokenId)) {
      return;
    }

    if (tokens[tokenId]! <= currentTime) {
      tokens.remove(tokenId);
      return;
    }

    tokens[tokenId] = currentTime + timeToLive;
  }

  int countUnexpiredTokens(int currentTime) {
    int count = 0;

    // Remove expired tokens
    tokens.removeWhere(
      (key, expiry) => expiry <= currentTime,
    );

    count = tokens.length;

    return count;
  }
}