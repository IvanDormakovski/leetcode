// Given an integer num, return the number of steps to reduce it to zero.

// In one step, if the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.

// Example 1:

// Input: num = 14
// Output: 6
// Explanation:
// Step 1) 14 is even; divide by 2 and obtain 7.
// Step 2) 7 is odd; subtract 1 and obtain 6.
// Step 3) 6 is even; divide by 2 and obtain 3.
// Step 4) 3 is odd; subtract 1 and obtain 2.
// Step 5) 2 is even; divide by 2 and obtain 1.
// Step 6) 1 is odd; subtract 1 and obtain 0.
// Example 2:

// Input: num = 8
// Output: 4
// Explanation:
// Step 1) 8 is even; divide by 2 and obtain 4.
// Step 2) 4 is even; divide by 2 and obtain 2.
// Step 3) 2 is even; divide by 2 and obtain 1.
// Step 4) 1 is odd; subtract 1 and obtain 0.
// Example 3:

// Input: num = 123
// Output: 12

// Constraints:

// 0 <= num <= 106

// Let me explain briefly,
// Usually we have to divide the number by 2 if it's even and subtract 1 if it's odd.
// Look if we see the binary form of an even number, we'll get 0 in the last and for odd numbers there will be 1 in the end. 2 -> 10 and 3 -> 11

// Now "&" operator returns 1 if both operands are 1 otherwise 0.
// So, if we compute 8 & 1 ->> (1000 & 1) ->> (1000 & 0001) ->> 0000
// and 3 & 1 ->> 11 & 1 ->> 01
// this is what the statement does: num & 1 ->> so if returns 0(for even) we'll have to divide by 2, means number of operations are 1 and if returns 1(for odd) we'll have to first subtract 1 then divide, so no. of operations became 2. Hence we do the above operation.

// After this num >>= 1 divides the number by 2, as irrespective of it is even or odd we'll get the same answer, so simply divide and as we've already calculated the answer already.

// And for the left most 1 for which we'll get 0 by just subtracting 1 but our logic considers it 2 so at last do res - 1.
// class Solution {
//   int numberOfSteps(int num) {
//     if (num == 0) return 0;
//     int res = 0;
//     while (num > 0) {
//       res += (num & 1 > 0) ? 2 : 1;
//       num >>= 1;
//     }
//     return res - 1;
//   }
// }

class Solution {
  int numberOfSteps(int num) {
    int count = 0;
    while (num > 0) {
      num.isEven ? num ~/= 2 : num -= 1;
      count++;
    }
    return count;
  }
}

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.numberOfSteps(0));
}
