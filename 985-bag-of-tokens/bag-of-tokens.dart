class Solution {
  int bagOfTokensScore(List<int> tokens, int power) {
    tokens.sort();
    
    int left = 0;
    int right = tokens.length - 1;
    int score = 0;
    int maxScore = 0;
    
    while (left <= right) {
      // Face-up (gain score)
      if (power >= tokens[left]) {
        power -= tokens[left];
        score++;
        left++;
        maxScore = score > maxScore ? score : maxScore;
      } 
      // Face-down (gain power)
      else if (score > 0) {
        power += tokens[right];
        score--;
        right--;
      } 
      else {
        break;
      }
    }
    
    return maxScore;
  }
}