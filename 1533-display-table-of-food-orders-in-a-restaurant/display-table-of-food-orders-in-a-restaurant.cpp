class Solution {
public:
    vector<vector<string>> displayTable(vector<vector<string>>& orders) {
        // Step 1: food items (sorted)
        set<string> foodSet;

        // Step 2: table -> (food -> count)
        map<int, map<string, int>> tableMap;

        for (auto &order : orders) {
            string customer = order[0];
            int table = stoi(order[1]);
            string food = order[2];

            foodSet.insert(food);
            tableMap[table][food]++;
        }

        // Convert foodSet to vector
        vector<string> foods(foodSet.begin(), foodSet.end());

        // Step 3: result
        vector<vector<string>> result;

        // Header row
        vector<string> header;
        header.push_back("Table");
        for (auto &f : foods) {
            header.push_back(f);
        }
        result.push_back(header);

        // Step 4: fill rows
        for (auto &t : tableMap) {
            vector<string> row;
            row.push_back(to_string(t.first)); // table number

            for (auto &f : foods) {
                row.push_back(to_string(t.second[f])); // count
            }

            result.push_back(row);
        }

        return result;
    }
};