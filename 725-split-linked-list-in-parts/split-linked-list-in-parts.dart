class Solution {
  List<ListNode?> splitListToParts(ListNode? head, int k) {
    // Step 1: length nikal lo
    int n = 0;
    ListNode? curr = head;
    while (curr != null) {
      n++;
      curr = curr.next;
    }

    // Step 2: base size and extra nodes
    int baseSize = n ~/ k;
    int extra = n % k;

    List<ListNode?> result = [];
    curr = head;

    // Step 3: parts banate jao
    for (int i = 0; i < k; i++) {
      ListNode? partHead = curr;
      int partSize = baseSize + (extra > 0 ? 1 : 0);
      if (extra > 0) extra--;

      // move to end of current part
      for (int j = 0; j < partSize - 1; j++) {
        if (curr != null) curr = curr.next;
      }

      // break link
      if (curr != null) {
        ListNode? next = curr.next;
        curr.next = null;
        curr = next;
      }

      result.add(partHead);
    }

    return result;
  }
}