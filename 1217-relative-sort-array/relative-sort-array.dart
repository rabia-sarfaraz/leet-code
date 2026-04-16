class Solution {
  List<int> relativeSortArray(List<int> arr1, List<int> arr2) {
    Map<int, int> freq = {};
    
    // Step 1: frequency count
    for (int num in arr1) {
      freq[num] = (freq[num] ?? 0) + 1;
    }
    
    List<int> result = [];
    
    // Step 2: follow arr2 order
    for (int num in arr2) {
      if (freq.containsKey(num)) {
        for (int i = 0; i < freq[num]!; i++) {
          result.add(num);
        }
        freq.remove(num);
      }
    }
    
    // Step 3: remaining elements (sort them)
    List<int> remaining = freq.keys.toList();
    remaining.sort();
    
    for (int num in remaining) {
      for (int i = 0; i < freq[num]!; i++) {
        result.add(num);
      }
    }
    
    return result;
  }
}