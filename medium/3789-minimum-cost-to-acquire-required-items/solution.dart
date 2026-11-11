
class Solution {
  int minimumCost(int cost1, int cost2, int costBoth, int need1, int need2) {

    int mn = need1 < need2 ? need1 : need2;
    int mx = need1 > need2 ? need1 : need2;

    int costSeparate = cost1 * need1 + cost2 * need2;

    int costAllBoth = costBoth * mx;

    int costMixed = costBoth * mn +
        cost1 * (need1 - mn) +
        cost2 * (need2 - mn);

    int result = costSeparate < costAllBoth
        ? costSeparate
        : costAllBoth;

    return result < costMixed ? result : costMixed;
  }
}
