// Given an array of integers nums, return the number of good pairs.

// A pair (i, j) is called good if nums[i] == nums[j] and i < j.

// Example 1:

// Input: nums = [1,2,3,1,1,3]
// Output: 4
// Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
// Example 2:

// Input: nums = [1,1,1,1]
// Output: 6
// Explanation: Each pair in the array are good.
// Example 3:

// Input: nums = [1,2,3]
// Output: 0

// Constraints:

// 1 <= nums.length <= 100
// 1 <= nums[i] <= 100

// class Solution {
//   int numIdenticalPairs(List<int> nums) {
//     int res = 0;
//     // Length of array should be more than max value in nums
//     List<int> count = List.generate(101, (index) => 0);
//     for (var num in nums) {
//       res += count[num]++;
//     }
//     return res;
//   }
// }

class Solution {
  int numIdenticalPairs(List<int> nums) {
    int res = 0;
    Map<int, int> map = {};
    for (var num in nums) {
      map.update(num, (value) => (map[num] ?? 0) + 1, ifAbsent: () => 0);
      res += map[num] ?? 0 - 1;
    }
    return res;
  }
}

// class Solution {
//   int numIdenticalPairs(List<int> nums) {
//     int count = 0;
//     for (var i = 0; i < nums.length; i++) {
//       for (var j = i + 1; j < nums.length; j++) {
//         if (nums[i] == nums[j]) count++;
//       }
//     }
//     return count;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.numIdenticalPairs([1, 2, 3, 1, 1, 3]));
  // print(solution.numIdenticalPairs([1, 1, 1, 1]));
}
