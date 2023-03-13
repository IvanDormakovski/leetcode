// Given an integer num, return the number of digits in num that divide num.

// An integer val divides nums if nums % val == 0.

// Example 1:

// Input: num = 7
// Output: 1
// Explanation: 7 divides itself, hence the answer is 1.
// Example 2:

// Input: num = 121
// Output: 2
// Explanation: 121 is divisible by 1, but not 2. Since 1 occurs twice as a digit, we return 2.
// Example 3:

// Input: num = 1248
// Output: 4
// Explanation: 1248 is divisible by all of its digits, hence the answer is 4.

// Constraints:

// 1 <= num <= 109
// num does not contain 0 as one of its digits.

class Solution {
  int countDigits(int num) {
    int count = 0;
    int value = num;
    while (value > 0) {
      if (num % (value % 10) == 0) count++;
      value = (value / 10).floor();
    }
    return count;
  }
}

// class Solution {
//   int countDigits(int num) {
//     int count = 0;
//     int parsedNumPart = num;
//     int divider = 1;
//     while (parsedNumPart > 0) {
//       parsedNumPart = (num / divider).floor();
//       int value = parsedNumPart % 10;
//       if (value != 0) {
//         num % value == 0 ? count++ : null;
//       }
//       divider *= 10;
//     }
//     return count;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.countDigits(1248));
}
