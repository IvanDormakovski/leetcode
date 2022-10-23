// Given a positive integer n, return the smallest positive integer that is a multiple of both 2 and n.

// Example 1:

// Input: n = 5
// Output: 10
// Explanation: The smallest multiple of both 5 and 2 is 10.
// Example 2:

// Input: n = 6
// Output: 6
// Explanation: The smallest multiple of both 6 and 2 is 6. Note that a number is a multiple of itself.

// Constraints:

// 1 <= n <= 150

// if n is even, return n << 0
// if n is odd, return n << 1

class Solution {
  int smallestEvenMultiple(int n) => n << (n & 1);
}

// class Solution {
//   int smallestEvenMultiple(int n) {
//     int i = n;
//     while (i % 2 != 0 || i % n != 0) {
//       i++;
//     }
//     return i;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.smallestEvenMultiple(77));
}
