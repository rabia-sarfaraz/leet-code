class Solution {
  List<int> numMovesStones(int a, int b, int c) {
    List<int> arr = [a, b, c];
    arr.sort();

    int x = arr[0], y = arr[1], z = arr[2];

    int gap1 = y - x - 1;
    int gap2 = z - y - 1;

    int maxMoves = gap1 + gap2;

    int minMoves;

    if (gap1 == 0 && gap2 == 0) {
      minMoves = 0;
    } 
    else if (gap1 <= 1 || gap2 <= 1) {
      minMoves = 1;
    } 
    else {
      minMoves = 2;
    }

    return [minMoves, maxMoves];
  }
}