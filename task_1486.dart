// You are given an integer n and an integer start.

// Define an array nums where nums[i] = start + 2 * i (0-indexed) and n == nums.length.

// Return the bitwise XOR of all elements of nums.

// Example 1:

// Input: n = 5, start = 0
// Output: 8
// Explanation: Array nums is equal to [0, 2, 4, 6, 8] where (0 ^ 2 ^ 4 ^ 6 ^ 8) = 8.
// Where "^" corresponds to bitwise XOR operator.
// Example 2:

// Input: n = 4, start = 3
// Output: 8
// Explanation: Array nums is equal to [3, 5, 7, 9] where (3 ^ 5 ^ 7 ^ 9) = 8.

// Constraints:

// 1 <= n <= 1000
// 0 <= start <= 1000
// n == nums.length

class Solution {
  int xorOperation(int n, int start) {
    int index = 0;
    int res = 0;
    while (index < n) {
      res ^= (start + index * 2);
      index++;
    }
    return res;
  }
}

// class Solution {
//   int xorOperation(int n, int start) {
//     List<int> array = List.generate(n, (index) => start + index * 2);
//     return array.reduce((value, element) => value ^ element);
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.xorOperation(5, 0));
}
