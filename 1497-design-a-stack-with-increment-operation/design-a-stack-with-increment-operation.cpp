class CustomStack {
public:
    int maxSize;
    vector<int> st, inc;

    CustomStack(int maxSize) {
        this->maxSize = maxSize;
    }
    
    void push(int x) {
        if (st.size() == maxSize) return;
        st.push_back(x);
        inc.push_back(0);
    }
    
    int pop() {
        if (st.empty()) return -1;

        int i = st.size() - 1;
        int res = st[i] + inc[i];

        if (i > 0) inc[i - 1] += inc[i];

        st.pop_back();
        inc.pop_back();

        return res;
    }
    
    void increment(int k, int val) {
        int i = min(k, (int)st.size()) - 1;
        if (i >= 0) inc[i] += val;
    }
};