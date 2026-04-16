class Solution {
public:
    vector<string> invalidTransactions(vector<string>& transactions) {
        int n = transactions.size();

        vector<string> name(n), city(n), res;
        vector<int> time(n), amount(n);
        vector<bool> invalid(n, false);

        // Step 1: parse
        for (int i = 0; i < n; i++) {
            string s = transactions[i];
            stringstream ss(s);

            getline(ss, name[i], ',');
            time[i] = stoi(getlineHelper(ss));
            amount[i] = stoi(getlineHelper(ss));
            getline(ss, city[i], ',');
        }

        // helper lambda for parsing ints safely
        auto parseField = [](stringstream &ss) -> string {
            string temp;
            getline(ss, temp, ',');
            return temp;
        };

        // fix parsing properly
        for (int i = 0; i < n; i++) {
            string s = transactions[i];
            stringstream ss(s);

            name[i] = parseField(ss);
            time[i] = stoi(parseField(ss));
            amount[i] = stoi(parseField(ss));
            city[i] = parseField(ss);
        }

        // Step 2: rule checks
        for (int i = 0; i < n; i++) {
            if (amount[i] > 1000) {
                invalid[i] = true;
            }

            for (int j = 0; j < n; j++) {
                if (i == j) continue;

                if (name[i] == name[j] &&
                    city[i] != city[j] &&
                    abs(time[i] - time[j]) <= 60) {
                    invalid[i] = true;
                }
            }
        }

        // Step 3: collect result
        for (int i = 0; i < n; i++) {
            if (invalid[i]) {
                res.push_back(transactions[i]);
            }
        }

        return res;
    }

private:
    string getlineHelper(stringstream &ss) {
        string temp;
        getline(ss, temp, ',');
        return temp;
    }
};