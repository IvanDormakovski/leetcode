// Given two arrays of integers nums and index. Your task is to create target array under the following rules:

// Initially target array is empty.
// From left to right read nums[i] and index[i], insert at index index[i] the value nums[i] in target array.
// Repeat the previous step until there are no elements to read in nums and index.
// Return the target array.

// It is guaranteed that the insertion operations will be valid.

// Example 1:

// Input: nums = [0,1,2,3,4], index = [0,1,2,2,1]
// Output: [0,4,1,3,2]
// Explanation:
// nums       index     target
// 0            0        [0]
// 1            1        [0,1]
// 2            2        [0,1,2]
// 3            2        [0,1,3,2]
// 4            1        [0,4,1,3,2]
// Example 2:

// Input: nums = [1,2,3,4,0], index = [0,1,2,3,0]
// Output: [0,1,2,3,4]
// Explanation:
// nums       index     target
// 1            0        [1]
// 2            1        [1,2]
// 3            2        [1,2,3]
// 4            3        [1,2,3,4]
// 0            0        [0,1,2,3,4]
// Example 3:

// Input: nums = [1], index = [0]
// Output: [1]

// class Solution {
//   List<int> createTargetArray(List<int> nums, List<int> index) {
//     List<int> target = List.filled(nums.length, 0);
//     for (int i = 0; i < index.length; i++) {
//       int ind = index[i];
//       if (ind < i) {
//         int j = i;
//         while (j > ind) {
//           target[j] = target[j - 1];
//           target[j - 1] = nums[i];
//           j--;
//         }
//       } else {
//         target[i] = nums[ind];
//       }
//     }
//     return target;
//   }
// }

class Solution {
  List<int> createTargetArray(List<int> nums, List<int> index) {
    List<int> result = [];
    for (int i = 0; i < index.length; i++) {
      result.insert(index[i], nums[i]);
    }
    return result;
  }
}

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.createTargetArray([0, 1, 2, 3, 4], [0, 1, 2, 2, 1]));
}
