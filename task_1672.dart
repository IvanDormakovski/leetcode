// You are given an m x n integer grid accounts where accounts[i][j] is the amount of money the i​​​​​​​​​​​th​​​​ customer has in the j​​​​​​​​​​​th​​​​ bank. Return the wealth that the richest customer has.

// A customer's wealth is the amount of money they have in all their bank accounts. The richest customer is the customer that has the maximum wealth.

// Example 1:

// Input: accounts = [[1,2,3],[3,2,1]]
// Output: 6
// Explanation:
// 1st customer has wealth = 1 + 2 + 3 = 6
// 2nd customer has wealth = 3 + 2 + 1 = 6
// Both customers are considered the richest with a wealth of 6 each, so return 6.
// Example 2:

// Input: accounts = [[1,5],[7,3],[3,5]]
// Output: 10
// Explanation:
// 1st customer has wealth = 6
// 2nd customer has wealth = 10
// 3rd customer has wealth = 8
// The 2nd customer is the richest with a wealth of 10.
// Example 3:

// Input: accounts = [[2,8,7],[7,1,3],[1,9,5]]
// Output: 17

// Constraints:

// m == accounts.length
// n == accounts[i].length
// 1 <= m, n <= 50
// 1 <= accounts[i][j] <= 100

class Solution {
  int maximumWealth(List<List<int>> accounts) {
    List<int> wealths = accounts
        .map((e) => e.fold(
            0, (previousValue, element) => (previousValue as int) + element))
        .toList();
    wealths.sort((first, second) => second - first);
    return wealths.first;
  }
}

// class Solution {
//   int maximumWealth(List<List<int>> accounts) => [
//         ...accounts.map((account) => account.reduce((val, curr) => val + curr))
//       ].reduce((max, curr) => curr > max ? curr : max);
// }

// class Solution {
//   int maximumWealth(List<List<int>> accounts) {
//     int maxWealth = 0;
//     for (var account in accounts) {
//       int sum = account.reduce((value, element) => value + element);
//       if (maxWealth < sum) maxWealth = sum;
//     }
//     return maxWealth;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.maximumWealth([
    [2, 8, 7],
    [7, 1, 3],
    [1, 9, 5]
  ]));
}
