// You are given a string s and an integer array indices of the same length. The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string.

// Return the shuffled string.

// Example 1:

// Input: s = "codeleet", indices = [4,5,6,7,0,2,1,3]
// Output: "leetcode"
// Explanation: As shown, "codeleet" becomes "leetcode" after shuffling.
// Example 2:

// Input: s = "abc", indices = [0,1,2]
// Output: "abc"
// Explanation: After shuffling, each character remains in its position.

// Constraints:

// s.length == indices.length == n
// 1 <= n <= 100
// s consists of only lowercase English letters.
// 0 <= indices[i] < n
// All values of indices are unique.

class Solution {
  String restoreString(String s, List<int> indices) {
    List<String> list = s.split('');
    for (int i = 0; i < list.length; i++) {
      while (i != indices[i]) {
        swapChar(list, i, indices[i]);
        swapInt(indices, i, indices[i]);
      }
    }
    return list.join('');
  }

  void swapInt(List<int> indices, int x, int y) {
    int temp = indices[x];
    indices[x] = indices[y];
    indices[y] = temp;
  }

  void swapChar(List<String> list, int x, int y) {
    String t = list[x];
    list[x] = list[y];
    list[y] = t;
  }
}

// class Solution {
//   String restoreString(String s, List<int> indices) {
//     String result = '';
//     for (var i = 0; i < indices.length; i++) {
//       result = result + s[indices.indexOf(i)];
//     }
//     return result;
//   }
// }

// class Solution {
//   String restoreString(String s, List<int> indices) {
//     List<String> result = List.filled(indices.length, '');
//     for (var i = 0; i < indices.length; i++) {
//       result[indices[i]] = s[i];
//     }
//     return result.join('');
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.restoreString('codeleet', [4, 5, 6, 7, 0, 2, 1, 3]));
}
