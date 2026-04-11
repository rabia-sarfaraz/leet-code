class FreqStack {
  Map<int, int> freq = {};
  Map<int, List<int>> group = {};
  int maxFreq = 0;

  FreqStack();

  void push(int val) {
    int f = (freq[val] ?? 0) + 1;
    freq[val] = f;

    if (f > maxFreq) {
      maxFreq = f;
    }

    group.putIfAbsent(f, () => []);
    group[f]!.add(val);
  }

  int pop() {
    int val = group[maxFreq]!.removeLast();

    freq[val] = freq[val]! - 1;

    if (group[maxFreq]!.isEmpty) {
      maxFreq--;
    }

    return val;
  }
}