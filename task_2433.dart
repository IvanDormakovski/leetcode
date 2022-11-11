// You are given an integer array pref of size n. Find and return the array arr of size n that satisfies:

// pref[i] = arr[0] ^ arr[1] ^ ... ^ arr[i].
// Note that ^ denotes the bitwise-xor operation.

// It can be proven that the answer is unique.

// Example 1:

// Input: pref = [5,2,0,3,1]
// Output: [5,7,2,3,2]
// Explanation: From the array [5,7,2,3,2] we have the following:
// - pref[0] = 5.
// - pref[1] = 5 ^ 7 = 2.
// - pref[2] = 5 ^ 7 ^ 2 = 0.
// - pref[3] = 5 ^ 7 ^ 2 ^ 3 = 3.
// - pref[4] = 5 ^ 7 ^ 2 ^ 3 ^ 2 = 1.
// Example 2:

// Input: pref = [13]
// Output: [13]
// Explanation: We have pref[0] = arr[0] = 13.

// Constraints:

// 1 <= pref.length <= 105
// 0 <= pref[i] <= 106

// Do this first:
// Given pref, find arr that
// pref[i] = arr[0] + arr[1] + ... + arr[i]
// pref is prefix sum of arr

// The solution is simple:

// for(int i = A.size() - 1; i > 0; --i)
//     A[i] -= A[i - 1];
// return A;
// Now we are doing something similar for this problem.

// Explanation
// Since pref is the prefix array,
// it's calculated from arr one by one,
// we can doing this process reverssely to recover the original array.

// Since
// pref[i] = pref[i-1] ^ A[i]
// so we have
// pref[i] ^ pref[i-1] = A[i]

// So we simply change - to ^ in the intuition solution

// The reverse operation of + is -
// The reverse operation of ^ is still ^
// More general, we can apply this solution to prefix of any operation.

// Complexity
// Time O(n)
// Space O(n)
class Solution {
  List<int> findArray(List<int> pref) {
    for (var i = pref.length - 1; i > 0; --i) {
      pref[i] ^= pref[i - 1];
    }
    return pref;
  }
}

// class Solution {
//   List<int> findArray(List<int> pref) {
//     List<int> result = List.filled(pref.length, 0);
//     result[0] = pref[0];
//     int temp = 0;
//     for (var i = 1; i < pref.length; i++) {
//       temp = temp ^ result[i - 1];
//       result[i] = pref[i] ^ temp;
//     }
//     return result;
//   }
// }

// class Solution {
//   List<int> findArray(List<int> pref) {
//     List<int> result = List.filled(pref.length, 0);
//     result[0] = pref[0];
//     int temp = result[0];
//     for (var i = 1; i < pref.length; i++) {
//       if (i >= 2) {
//         temp = temp ^ result[i - 1];
//         result[i] = pref[i] ^ temp;
//       }
//       result[i] = pref[i] ^ temp;
//     }
//     return result;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.findArray([5, 2, 0, 3, 1]));
}
