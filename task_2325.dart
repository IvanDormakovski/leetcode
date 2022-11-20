// You are given the strings key and message, which represent a cipher key and a secret message, respectively. The steps to decode message are as follows:

// Use the first appearance of all 26 lowercase English letters in key as the order of the substitution table.
// Align the substitution table with the regular English alphabet.
// Each letter in message is then substituted using the table.
// Spaces ' ' are transformed to themselves.
// For example, given key = "happy boy" (actual key would have at least one instance of each letter in the alphabet), we have the partial substitution table of ('h' -> 'a', 'a' -> 'b', 'p' -> 'c', 'y' -> 'd', 'b' -> 'e', 'o' -> 'f').
// Return the decoded message.

// Example 1:

// Input: key = "the quick brown fox jumps over the lazy dog", message = "vkbs bs t suepuv"
// Output: "this is a secret"
// Explanation: The diagram above shows the substitution table.
// It is obtained by taking the first appearance of each letter in "the quick brown fox jumps over the lazy dog".
// Example 2:

// Input: key = "eljuxhpwnyrdgtqkviszcfmabo", message = "zwx hnfx lqantp mnoeius ycgk vcnjrdb"
// Output: "the five boxing wizards jump quickly"
// Explanation: The diagram above shows the substitution table.
// It is obtained by taking the first appearance of each letter in "eljuxhpwnyrdgtqkviszcfmabo".

// Constraints:

// 26 <= key.length <= 2000
// key consists of lowercase English letters and ' '.
// key contains every letter in the English alphabet ('a' to 'z') at least once.
// 1 <= message.length <= 2000
// message consists of lowercase English letters and ' '.

class Solution {
  String decodeMessage(String key, String message) {
    Map<String, String> map = {};
    String result = '';
    for (var i = 0, k = -1; i < key.length; i++) {
      if (map.length == 27) break;
      if (key[i] == ' ') continue;
      map.putIfAbsent(key[i], () {
        k++;
        return String.fromCharCode(k + 97);
      });
    }
    for (var i = 0; i < message.length; i++) {
      result = '$result${map[message[i]] ?? ' '}';
    }
    return result;
  }
}

// class Solution {
//   String decodeMessage(String key, String message) {
//     Set<int> keySet = key.split('').toSet().map((e) => e.codeUnitAt(0)).toSet();
//     keySet.remove(32);
//     Map<int, int> map = {};
//     for (var i = 0; i < keySet.length; i++) {
//       map.putIfAbsent(keySet.elementAt(i), () => i + 97);
//     }

//     List<String> result = message.split('');
//     for (var i = 0; i < result.length; i++) {
//       if (result[i] != ' ') {
//         result[i] = String.fromCharCode(map[result[i].codeUnitAt(0)] ?? 0);
//       }
//     }
//     return result.join();
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.decodeMessage(
      "the quick brown fox jumps over the lazy dog", "vkbs bs t suepuv"));
}
