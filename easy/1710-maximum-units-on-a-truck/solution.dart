class Solution {
  int maximumUnits(List<List<int>> boxTypes, int truckSize) {
    // Units per box ke descending order mein sort
    boxTypes.sort((a, b) => b[1].compareTo(a[1]));

    int units = 0;

    for (var box in boxTypes) {
      int boxes = box[0];
      int unitsPerBox = box[1];

      int take = boxes < truckSize ? boxes : truckSize;

      units += take * unitsPerBox;
      truckSize -= take;

      if (truckSize == 0) {
        break;
      }
    }

    return units;
  }
}