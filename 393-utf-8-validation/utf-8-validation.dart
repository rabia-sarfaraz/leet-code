class Solution {
  bool validUtf8(List<int> data) {
    int expect = 0;

    for (int num in data) {
      num = num & 0xFF;

      if (expect == 0) {
        if ((num >> 7) == 0) {
          // 1-byte char
          continue;
        } 
        else if ((num >> 5) == 0x6) {
          expect = 1;
        } 
        else if ((num >> 4) == 0xE) {
          expect = 2;
        } 
        else if ((num >> 3) == 0x1E) {
          expect = 3;
        } 
        else {
          return false;
        }
      } 
      else {
        // must be 10xxxxxx
        if ((num >> 6) != 0x2) {
          return false;
        }
        expect--;
      }
    }

    return expect == 0;
  }
}