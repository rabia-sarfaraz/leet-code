class H2O {
private:
    mutex mtx;
    condition_variable cv;
    int hCount = 0;
    int oCount = 0;

public:
    H2O() {}

    void hydrogen(function<void()> releaseHydrogen) {
        unique_lock<mutex> lock(mtx);
        
        cv.wait(lock, [&]() { return hCount < 2; });
        
        releaseHydrogen();
        hCount++;
        
        if (hCount == 2 && oCount == 1) {
            hCount = 0;
            oCount = 0;
        }
        
        cv.notify_all();
    }

    void oxygen(function<void()> releaseOxygen) {
        unique_lock<mutex> lock(mtx);
        
        cv.wait(lock, [&]() { return hCount == 2 && oCount == 0; });
        
        releaseOxygen();
        oCount = 1;
        
        if (hCount == 2 && oCount == 1) {
            hCount = 0;
            oCount = 0;
        }
        
        cv.notify_all();
    }
};