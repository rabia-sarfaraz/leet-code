#include <bits/stdc++.h>
using namespace std;

class LFUCache {
public:
    struct Node {
        int key, value, freq;
    };

    int cap;
    int minFreq;

    // key -> (value, freq, iterator in freq list)
    unordered_map<int, list<Node>::iterator> mp;

    // freq -> list of nodes (LRU order inside same freq)
    unordered_map<int, list<Node>> freqList;

    LFUCache(int capacity) {
        cap = capacity;
        minFreq = 0;
    }

    void touch(list<Node>::iterator it) {
        Node node = *it;
        int f = node.freq;
        int key = node.key;

        // remove from old freq list
        freqList[f].erase(it);

        if (freqList[f].empty()) {
            freqList.erase(f);
            if (minFreq == f) minFreq++;
        }

        // increase freq
        node.freq++;

        // add to new freq list (front = most recent)
        freqList[node.freq].push_front(node);

        // update map iterator
        mp[key] = freqList[node.freq].begin();
    }

    int get(int key) {
        if (!mp.count(key)) return -1;

        auto it = mp[key];
        int val = it->value;

        touch(it);

        return val;
    }

    void put(int key, int value) {
        if (cap == 0) return;

        // if key exists → update
        if (mp.count(key)) {
            auto it = mp[key];
            it->value = value;
            touch(it);
            return;
        }

        // if full → evict LFU
        if (mp.size() == cap) {
            auto &lst = freqList[minFreq];
            auto delNode = lst.back();

            int delKey = delNode.key;

            lst.pop_back();
            if (lst.empty()) freqList.erase(minFreq);

            mp.erase(delKey);
        }

        // insert new node with freq = 1
        Node node = {key, value, 1};
        freqList[1].push_front(node);
        mp[key] = freqList[1].begin();
        minFreq = 1;
    }
};