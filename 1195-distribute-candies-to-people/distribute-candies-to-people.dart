class Solution {
  List<int> distributeCandies(int candies, int num_people) {
    List<int> res = List.filled(num_people, 0);
    
    int give = 1;   // next candies to give
    int i = 0;      // current person index
    
    while (candies > 0) {
      int idx = i % num_people;
      
      int toGive = give <= candies ? give : candies;
      
      res[idx] += toGive;
      candies -= toGive;
      
      give++;
      i++;
    }
    
    return res;
  }
}