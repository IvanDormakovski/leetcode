// Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].

// Return the answer in an array.

// Example 1:

// Input: nums = [8,1,2,2,3]
// Output: [4,0,1,1,3]
// Explanation:
// For nums[0]=8 there exist four smaller numbers than it (1, 2, 2 and 3).
// For nums[1]=1 does not exist any smaller number than it.
// For nums[2]=2 there exist one smaller number than it (1).
// For nums[3]=2 there exist one smaller number than it (1).
// For nums[4]=3 there exist three smaller numbers than it (1, 2 and 2).
// Example 2:

// Input: nums = [6,5,4,8]
// Output: [2,1,0,3]
// Example 3:

// Input: nums = [7,7,7,7]
// Output: [0,0,0,0]

// Constraints:

// 2 <= nums.length <= 500
// 0 <= nums[i] <= 100

class Solution {
  List<int> smallerNumbersThanCurrent(List<int> nums) {
    Map<int, int> map = {};
    List<int> numsCopy = [...nums];
    numsCopy.sort();

    for (var i = 0; i < numsCopy.length; i++) {
      map.putIfAbsent(numsCopy[i], () => i);
    }

    for (var i = 0; i < numsCopy.length; i++) {
      numsCopy[i] = map[nums[i]] ?? 0;
    }

    return numsCopy;
  }
}

// class Solution {
//   List<int> smallerNumbersThanCurrent(List<int> nums) {
//     List<int> counts = List.filled(101, 0);
//     List<int> result = List.filled(nums.length, 0);

//     for (var i = 0; i < nums.length; i++) {
//       counts[nums[i]]++;
//     }
//     print(counts);
//     print('-' * 100);
//     for (var i = 1; i <= 100; i++) {
//       counts[i] += counts[i - 1];
//     }
//     print(counts);
//     print('-' * 100);
//     for (var i = 0; i < nums.length; i++) {
//       if (nums[i] == 0) {
//         result[i] = 0;
//       } else {
//         result[i] = counts[nums[i] - 1];
//       }
//     }
//     return result;
//   }
// }

// class Solution {
//   List<int> smallerNumbersThanCurrent(List<int> nums) {
//     List<int> result = [];
//     for (var i = 0; i < nums.length; i++) {
//       int count = 0;
//       for (var j = 0; j < nums.length; j++) {
//         if (i == j) continue;
//         if (nums[i] > nums[j]) count++;
//       }
//       result.add(count);
//     }
//     return result;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.smallerNumbersThanCurrent([8, 1, 2, 2, 3]));
}
