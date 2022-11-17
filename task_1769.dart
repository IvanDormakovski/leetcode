// You have n boxes. You are given a binary string boxes of length n, where boxes[i] is '0' if the ith box is empty, and '1' if it contains one ball.

// In one operation, you can move one ball from a box to an adjacent box. Box i is adjacent to box j if abs(i - j) == 1. Note that after doing so, there may be more than one ball in some boxes.

// Return an array answer of size n, where answer[i] is the minimum number of operations needed to move all the balls to the ith box.

// Each answer[i] is calculated considering the initial state of the boxes.

// Example 1:

// Input: boxes = "110"
// Output: [1,1,3]
// Explanation: The answer for each box is as follows:
// 1) First box: you will have to move one ball from the second box to the first box in one operation.
// 2) Second box: you will have to move one ball from the first box to the second box in one operation.
// 3) Third box: you will have to move one ball from the first box to the third box in two operations, and move one ball from the second box to the third box in one operation.
// Example 2:

// Input: boxes = "001011"
// Output: [11,8,5,4,3,4]

// Constraints:

// n == boxes.length
// 1 <= n <= 2000
// boxes[i] is either '0' or '1'.

class Solution {
  List<int> minOperations(String boxes) {
    List<int> result = List.filled(boxes.length, 0);

    for (int i = 0, ops = 0, cnt = 0; i < boxes.length; ++i) {
      result[i] += ops;
      cnt += boxes[i] == '1' ? 1 : 0;
      ops += cnt;
    }

    for (int i = boxes.length - 1, ops = 0, cnt = 0; i >= 0; --i) {
      result[i] += ops;
      cnt += boxes[i] == '1' ? 1 : 0;
      ops += cnt;
    }

    return result;
  }
}

// class Solution {
//   List<int> minOperations(String boxes) {
//     List<String> temp = boxes.split('');
//     List<int> result = List.filled(temp.length, 0);
//     for (int i = 0; i < temp.length; i++) {
//       for (int k = 0; k < temp.length; k++) {
//         if (i == k) continue;
//         if (temp[k] == '1') {
//           result[i] += (k - i).abs();
//         }
//       }
//     }
//     return result;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.minOperations("001011"));
}
