class Solution {
  int countDifferentSubsequenceGCDs(List<int> nums) {
    int maxVal = 0;

    for (int x in nums) {
      if (x > maxVal) {
        maxVal = x;
      }
    }

    // Check karta hai ke value nums mein actually present hai ya nahi
    List<bool> present = List.filled(maxVal + 1, false);

    for (int x in nums) {
      present[x] = true;
    }

    int answer = 0;

    for (int gcd = 1; gcd <= maxVal; gcd++) {
      int currentGcd = 0;

      // gcd ke multiples check karo
      for (int multiple = gcd; multiple <= maxVal; multiple += gcd) {
        if (present[multiple]) {
          currentGcd = _gcd(currentGcd, multiple);

          if (currentGcd == gcd) {
            answer++;
            break;
          }
        }
      }
    }

    return answer;
  }

  int _gcd(int a, int b) {
    while (b != 0) {
      int temp = a % b;
      a = b;
      b = temp;
    }

    return a;
  }
}