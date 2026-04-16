class ZeroEvenOdd {
private:
    int n;
    int state;
    int num;
    mutex mtx;
    condition_variable cv;

public:
    ZeroEvenOdd(int n) {
        this->n = n;
        state = 0; // zero starts first
        num = 1;
    }

    void zero(function<void(int)> printNumber) {
        for (int i = 0; i < n; i++) {
            unique_lock<mutex> lock(mtx);
            
            cv.wait(lock, [&]() { return state == 0; });
            
            printNumber(0);
            
            if (num % 2 == 1)
                state = 1; // odd turn
            else
                state = 2; // even turn
            
            cv.notify_all();
        }
    }

    void odd(function<void(int)> printNumber) {
        for (int i = 1; i <= n; i += 2) {
            unique_lock<mutex> lock(mtx);
            
            cv.wait(lock, [&]() { return state == 1; });
            
            printNumber(num);
            num++;
            
            state = 0;
            cv.notify_all();
        }
    }

    void even(function<void(int)> printNumber) {
        for (int i = 2; i <= n; i += 2) {
            unique_lock<mutex> lock(mtx);
            
            cv.wait(lock, [&]() { return state == 2; });
            
            printNumber(num);
            num++;
            
            state = 0;
            cv.notify_all();
        }
    }
};