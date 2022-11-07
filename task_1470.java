// Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].

// Return the array in the form [x1,y1,x2,y2,...,xn,yn].

 

// Example 1:

// Input: nums = [2,5,1,3,4,7], n = 3
// Output: [2,3,5,4,1,7] 
// Explanation: Since x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 then the answer is [2,3,5,4,1,7].
// Example 2:

// Input: nums = [1,2,3,4,4,3,2,1], n = 4
// Output: [1,4,2,3,3,2,4,1]
// Example 3:

// Input: nums = [1,1,2,2], n = 2
// Output: [1,2,1,2]
 

// Constraints:

// 1 <= n <= 500
// nums.length == 2n
// 1 <= nums[i] <= 10^3

class Solution1470 {
    public int[] shuffle(int[] nums, int n) {
        
        int len = nums.length;
        
        for(int i = n; i < len; i++) {
            nums[i] = (nums[i] << 10) | nums[i - n];
        }
        
        int index = 0;
        for(int i = n; i < len; i++, index += 2) {
            nums[index] = nums[i] & 1023;
            nums[index + 1] = nums[i] >>> 10;
        }
        
        return nums;
    }
}

// class Solution {
//     public int[] shuffle(int[] nums, int n) {
        
//         int len = nums.length;
		
// 		// to store the pair of numbers in right half of the original array
//         for(int i = n; i < len; i++) {
//             nums[i] = (nums[i] * 1024) + nums[i - n];
//         }
        
//         for(int i = 0; i < len; i++) {
//             System.out.print(nums[i]);
//             System.out.print("-");
//         }

//         int index = 0;
// 		// to retrive values from the pair of numbers and placing those retrieved value at their desired position
//         for(int i = n; i < len; i++, index += 2) {
//             nums[index] = nums[i] % 1024;
//             nums[index + 1] = nums[i] / 1024;
//         }
        
//         return nums;
//     }
// }

// class Solution {
//     public int[] shuffle(int[] nums, int n) {
//         int[] ans = new int[nums.length];
//         for (int i = 0; i < n; i++) {
//             ans[i * 2] = nums[i];
//             ans[i * 2 + 1] = nums[i + n];
//         }
//         return ans;
//     }
// }

class Runner1470 {
    public static void main(String[] args) {
        Solution solution = new Solution();
        int[] res = solution.shuffle(new int[] { 2, 5, 1, 3, 4, 7 }, 3);
        System.out.print("\n");
        for (int i = 0; i < res.length; i++) {
            System.out.print(res[i]);
            System.out.print("|");
        }
    }
}