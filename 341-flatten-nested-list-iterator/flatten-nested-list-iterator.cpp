class NestedIterator {
private:
    stack<NestedInteger> st;

public:
    NestedIterator(vector<NestedInteger> &nestedList) {
        for (int i = nestedList.size() - 1; i >= 0; i--) {
            st.push(nestedList[i]);
        }
    }

    int next() {
        hasNext();
        int val = st.top().getInteger();
        st.pop();
        return val;
    }

    bool hasNext() {
        while (!st.empty()) {
            NestedInteger curr = st.top();

            if (curr.isInteger()) {
                return true;
            }

            st.pop();
            vector<NestedInteger> lst = curr.getList();

            for (int i = lst.size() - 1; i >= 0; i--) {
                st.push(lst[i]);
            }
        }

        return false;
    }
};