class Solution {
public:
    int dfs(int id, unordered_map<int, Employee*>& mp) {
        Employee* emp = mp[id];

        int total = emp->importance;

        for (int sub : emp->subordinates) {
            total += dfs(sub, mp);
        }

        return total;
    }

    int getImportance(vector<Employee*> employees, int id) {
        unordered_map<int, Employee*> mp;

        for (auto e : employees) {
            mp[e->id] = e;
        }

        return dfs(id, mp);
    }
};