#include <stdlib.h>

int cmp(const void* a, const void* b) {
    int* x = (int*)a;
    int* y = (int*)b;
    return y[1] - x[1]; // sort by frequency desc
}

int* rearrangeBarcodes(int* barcodes, int barcodesSize, int* returnSize) {
    *returnSize = barcodesSize;

    // Step 1: frequency array (size constraint problem typical <= 10000)
    int freq[10001] = {0};

    for (int i = 0; i < barcodesSize; i++) {
        freq[barcodes[i]]++;
    }

    // Step 2: build pairs [value, freq]
    int arr[barcodesSize][2];
    int idx = 0;

    for (int i = 0; i <= 10000; i++) {
        if (freq[i] > 0) {
            arr[idx][0] = i;
            arr[idx][1] = freq[i];
            idx++;
        }
    }

    // Step 3: sort by frequency descending
    qsort(arr, idx, sizeof(arr[0]), cmp);

    // Step 4: fill result array
    int* res = (int*)malloc(sizeof(int) * barcodesSize);

    int pos = 0;

    for (int i = 0; i < idx; i++) {
        int val = arr[i][0];
        int count = arr[i][1];

        for (int j = 0; j < count; j++) {
            res[pos] = val;
            pos += 2;

            if (pos >= barcodesSize) {
                pos = 1; // switch to odd indices
            }
        }
    }

    return res;
}