// Write an algorithm to determine if a number n is happy.

// A happy number is a number defined by the following process:

// Starting with any positive integer, replace the number by the sum of the squares of its digits.
// Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
// Those numbers for which this process ends in 1 are happy.
// Return true if n is a happy number, and false if not.

// Example 1:

// Input: n = 19
// Output: true
// Explanation:
// 1^2 + 9^2 = 82
// 8^2 + 2^2 = 68
// 6^2 + 8^2 = 100
// 1^2 + 0^2 + 0^2 = 1
// Example 2:

// Input: n = 2
// Output: false

// Constraints:

// 1 <= n <= 231 - 1

class Solution {
  bool isHappy(int n) {
    Set<int> inLoop = {};
    int squareSum, remain;
    while (inLoop.add(n)) {
      squareSum = 0;
      while (n > 0) {
        remain = n % 10;
        squareSum += remain * remain;
        n = (n / 10).floor();
      }
      if (squareSum == 1)
        return true;
      else
        n = squareSum;
    }
    return false;
  }
}

// class Solution {
//   int digitSquareSum(int n) {
//     int sum = 0, tmp;
//     while (n > 0) {
//       tmp = n % 10;
//       sum += tmp * tmp;
//       n = (n / 10).floor();
//     }
//     return sum;
//   }

//   bool isHappy(int n) {
//     int slow, fast;
//     slow = fast = n;
//     do {
//       slow = digitSquareSum(slow);
//       fast = digitSquareSum(fast);
//       fast = digitSquareSum(fast);
//     } while (slow != fast);
//     if (slow == 1)
//       return true;
//     else
//       return false;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.isHappy(12));
}
