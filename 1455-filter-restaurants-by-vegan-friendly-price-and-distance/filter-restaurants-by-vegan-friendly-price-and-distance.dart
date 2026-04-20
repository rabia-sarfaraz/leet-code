class Solution {
  List<int> filterRestaurants(
      List<List<int>> restaurants,
      int veganFriendly,
      int maxPrice,
      int maxDistance) {

    // Step 1: filter
    List<List<int>> filtered = restaurants.where((r) {
      if (veganFriendly == 1 && r[2] != 1) return false;
      if (r[3] > maxPrice) return false;
      if (r[4] > maxDistance) return false;
      return true;
    }).toList();

    // Step 2: sort
    filtered.sort((a, b) {
      if (b[1] != a[1]) return b[1].compareTo(a[1]); // rating desc
      return b[0].compareTo(a[0]); // id desc
    });

    // Step 3: extract ids
    return filtered.map((r) => r[0]).toList();
  }
}