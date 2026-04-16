class Solution {
public:
    static const int MOD = 1e9 + 7;

    long long fact(int x) {
        long long res = 1;
        for (int i = 1; i <= x; i++) {
            res = (res * i) % MOD;
        }
        return res;
    }

    int numPrimeArrangements(int n) {
        vector<bool> isPrime(n + 1, true);
        isPrime[0] = isPrime[1] = false;

        for (int i = 2; i * i <= n; i++) {
            if (isPrime[i]) {
                for (int j = i * i; j <= n; j += i) {
                    isPrime[j] = false;
                }
            }
        }

        int primes = 0;
        for (int i = 2; i <= n; i++) {
            if (isPrime[i]) primes++;
        }

        long long ans = (fact(primes) * fact(n - primes)) % MOD;
        return (int)ans;
    }
};