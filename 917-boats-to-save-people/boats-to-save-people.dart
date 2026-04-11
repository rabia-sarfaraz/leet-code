class Solution {
  int numRescueBoats(List<int> people, int limit) {
    people.sort();

    int i = 0;
    int j = people.length - 1;
    int boats = 0;

    while (i <= j) {
      if (people[i] + people[j] <= limit) {
        i++;
      }
      j--;
      boats++;
    }

    return boats;
  }
}