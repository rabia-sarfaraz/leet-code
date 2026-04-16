class DinnerPlates {
    int cap;
    vector<stack<int>> st;
    set<int> available; // stacks with space
    int rightMost;

public:
    DinnerPlates(int capacity) {
        cap = capacity;
        rightMost = 0;
    }

    void push(int val) {
        while (!available.empty() && *available.begin() < st.size() &&
               st[*available.begin()].size() == cap) {
            available.erase(available.begin());
        }

        int idx;
        if (!available.empty()) {
            idx = *available.begin();
        } else {
            idx = st.size();
            st.push_back(stack<int>());
        }

        st[idx].push(val);

        if (st[idx].size() == cap) {
            available.erase(idx);
        } else {
            available.insert(idx);
        }

        rightMost = max(rightMost, idx);
    }

    int pop() {
        while (rightMost >= 0 && (rightMost >= st.size() || st[rightMost].empty())) {
            rightMost--;
        }

        if (rightMost < 0) return -1;

        int val = st[rightMost].top();
        st[rightMost].pop();

        available.insert(rightMost);

        return val;
    }

    int popAtStack(int index) {
        if (index >= st.size() || st[index].empty()) return -1;

        int val = st[index].top();
        st[index].pop();

        available.insert(index);

        return val;
    }
};