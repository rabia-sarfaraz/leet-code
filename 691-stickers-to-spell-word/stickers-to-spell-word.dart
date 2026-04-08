class Solution {
  Map<String, int> memo = {};

  int minStickers(List<String> stickers, String target) {
    int res = dfs(stickers, target);
    return res >= 1 << 30 ? -1 : res;
  }

  int dfs(List<String> stickers, String target) {
    if (target.isEmpty) return 0;
    if (memo.containsKey(target)) return memo[target]!;

    List<int> targetCount = List.filled(26, 0);
    for (int i = 0; i < target.length; i++) {
      targetCount[target.codeUnitAt(i) - 97]++;
    }

    int ans = 1 << 30;

    for (String sticker in stickers) {
      // skip if sticker doesn't help
      bool useful = false;
      for (int i = 0; i < sticker.length; i++) {
        if (target.contains(sticker[i])) {
          useful = true;
          break;
        }
      }
      if (!useful) continue;

      List<int> stickerCount = List.filled(26, 0);
      for (int i = 0; i < sticker.length; i++) {
        stickerCount[sticker.codeUnitAt(i) - 97]++;
      }

      StringBuffer sb = StringBuffer();

      for (int i = 0; i < 26; i++) {
        int remain = targetCount[i] - stickerCount[i];
        for (int j = 0; j < (remain > 0 ? remain : 0); j++) {
          sb.write(String.fromCharCode(i + 97));
        }
      }

      String newTarget = sb.toString();
      int tmp = dfs(stickers, newTarget);

      if (tmp != -1) {
        ans = ans < tmp + 1 ? ans : tmp + 1;
      }
    }

    memo[target] = (ans == 1 << 30) ? -1 : ans;
    return memo[target]!;
  }
}