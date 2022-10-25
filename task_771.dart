// You're given strings jewels representing the types of stones that are jewels, and stones representing the stones you have. Each character in stones is a type of stone you have. You want to know how many of the stones you have are also jewels.

// Letters are case sensitive, so "a" is considered a different type of stone from "A".

// Example 1:

// Input: jewels = "aA", stones = "aAAbbbb"
// Output: 3
// Example 2:

// Input: jewels = "z", stones = "ZZ"
// Output: 0

// Constraints:

// 1 <= jewels.length, stones.length <= 50
// jewels and stones consist of only English letters.
// All the characters of jewels are unique.

// replaces all characters with "" except characters in jewels
class Solution {
  int numJewelsInStones(String jewels, String stones) =>
      stones.replaceAll(RegExp("[^" + jewels + "]"), "").length;
}

// class Solution {
//   int numJewelsInStones(String jewels, String stones) {
//     int count = 0;
//     for (var stone in stones.split('')) {
//       jewels.contains(stone) ? count++ : null;
//     }
//     return count;
//   }
// }

// class Solution {
//   int numJewelsInStones(String jewels, String stones) {
//     int count = 0;
//     List<String> splitted = jewels.split('');
//     for (var stone in stones.split('')) {
//       splitted.contains(stone) ? count++ : null;
//     }
//     return count;
//   }
// }

// class Solution {
//   int numJewelsInStones(String jewels, String stones) {
//     int count = 0;
//     Map<String, int> map = Map.fromIterable(jewels.split(''),
//         key: (jewel) => jewel, value: (_) => 0);
//     for (var stone in stones.split('')) {
//       map.containsKey(stone) ? count++ : null;
//     }
//     return count;
//   }
// }

// class Solution {
//   int numJewelsInStones(String jewels, String stones) {
//     Map<String, int> map = Map.fromIterable(jewels.split(''),
//         key: (jewel) => jewel, value: (_) => 0);
//     for (var stone in stones.split('')) {
//       map.containsKey(stone)
//           ? map.update(
//               stone,
//               (value) => (map[stone] ?? 0) + 1,
//             )
//           : null;
//     }
//     return map.values.reduce((value, element) => value + element);
//   }
// }

// class Solution {
//   int numJewelsInStones(String jewels, String stones) {
//     int count = 0;
//     for (var jewel in jewels.split('')) {
//       count += RegExp('$jewel').allMatches(stones).length;
//     }
//     return count;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.numJewelsInStones('aA', 'aaAAbbbbA'));
}
