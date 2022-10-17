// A pangram is a sentence where every letter of the English alphabet appears at least once.

// Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or false otherwise.

// Example 1:

// Input: sentence = "thequickbrownfoxjumpsoverthelazydog"
// Output: true
// Explanation: sentence contains at least one of every letter of the English alphabet.
// Example 2:

// Input: sentence = "leetcode"
// Output: false
 

// Constraints:

// 1 <= sentence.length <= 1000
// sentence consists of lowercase English letters.

class Solution {
  bool checkIfPangram(String sentence) {
    Set uniqueLetters = sentence.split('').toSet();
    if (uniqueLetters.length == 26) {
      return true;
    }
    return false;
  }
}

// class Solution {
//   List allEnglishLetters = ['a', 'b', 'c', 'd','e', 'f',
//                             'g', 'h', 'i', 'j', 'k', 'l',
//                             'm', 'n', 'o', 'p', 'q', 'r', 
//                             's', 't', 'u', 'v', 'w', 'x',
//                             'y', 'z'];
    
//   bool checkIfPangram(String sentence) {
//     for (var letter in allEnglishLetters) {
//         if (!sentence.contains(letter)) {
//             return false;
//         }
//     }
//     return true;
//   }
// }

// class Solution {
//   bool checkIfPangram(String sentence) {
//     int start = 'a'.codeUnitAt(0);
//     int end = 'z'.codeUnitAt(0);

//     while (start <= end) {
//       if (sentence.indexOf(String.fromCharCode(start)) == -1) {
//         return false;
//       }
//       start++;
//     }
//     return true;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.checkIfPangram('thequickbrownfoxjumpsoverthelazydoggggg'));
}