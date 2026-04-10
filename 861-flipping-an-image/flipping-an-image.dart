class Solution {
  List<List<int>> flipAndInvertImage(List<List<int>> image) {
    int n = image.length;

    for (int i = 0; i < n; i++) {
      int left = 0, right = image[i].length - 1;

      while (left <= right) {
        int temp = image[i][left] ^ 1;
        image[i][left] = image[i][right] ^ 1;
        image[i][right] = temp;

        left++;
        right--;
      }
    }

    return image;
  }
}