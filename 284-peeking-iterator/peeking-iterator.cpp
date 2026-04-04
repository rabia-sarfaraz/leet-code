class PeekingIterator : public Iterator {
private:
    int nextVal;
    bool hasCache;

public:
    PeekingIterator(const vector<int>& nums) : Iterator(nums) {
        hasCache = false;
    }

    int peek() {
        if (!hasCache) {
            nextVal = Iterator::next();
            hasCache = true;
        }
        return nextVal;
    }

    int next() {
        if (hasCache) {
            hasCache = false;
            return nextVal;
        }
        return Iterator::next();
    }

    bool hasNext() const {
        return hasCache || Iterator::hasNext();
    }
};