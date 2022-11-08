// There is a city composed of n x n blocks, where each block contains a single building shaped like a vertical square prism. You are given a 0-indexed n x n integer matrix grid where grid[r][c] represents the height of the building located in the block at row r and column c.

// A city's skyline is the the outer contour formed by all the building when viewing the side of the city from a distance. The skyline from each cardinal direction north, east, south, and west may be different.

// We are allowed to increase the height of any number of buildings by any amount (the amount can be different per building). The height of a 0-height building can also be increased. However, increasing the height of a building should not affect the city's skyline from any cardinal direction.

// Return the maximum total sum that the height of the buildings can be increased by without changing the city's skyline from any cardinal direction.

// Example 1:

// Input: grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]
// Output: 35
// Explanation: The building heights are shown in the center of the above image.
// The skylines when viewed from each cardinal direction are drawn in red.
// The grid after increasing the height of buildings without affecting skylines is:
// gridNew = [ [8, 4, 8, 7],
//             [7, 4, 7, 7],
//             [9, 4, 8, 7],
//             [3, 3, 3, 3] ]
// Example 2:

// Input: grid = [[0,0,0],[0,0,0],[0,0,0]]
// Output: 0
// Explanation: Increasing the height of any building will result in the skyline changing.

// Constraints:

// n == grid.length
// n == grid[r].length
// 2 <= n <= 50
// 0 <= grid[r][c] <= 100

import 'dart:math';

class Solution {
  int maxIncreaseKeepingSkyline(List<List<int>> grid) {
    int n = grid.length;
    List<int> col = List.filled(n, 0), row = List.filled(n, 0);
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        row[i] = max(row[i], grid[i][j]);
        col[j] = max(col[j], grid[i][j]);
      }
    }
    int res = 0;
    for (int i = 0; i < n; i++)
      for (int j = 0; j < n; j++) res += min(row[i], col[j]) - grid[i][j];
    return res;
  }
}

// class Solution {
//   int maxIncreaseKeepingSkyline(List<List<int>> grid) {
//     int sum = 0;
//     // passing through lines
//     for (int i = 0; i < grid.length; i++) {
//       int maxOnLine = 0;
//       // passing through elements in line
//       for (int k = 0; k < grid[i].length; k++) {
//         int maxOnColumn = 0;
//         // find max element in line
//         maxOnLine = max(maxOnLine, grid[i][k]);
//         // pass through each column relative to the elements in the line and find max element in column
//         for (var m = 0; m < grid.length; m++) {
//           maxOnColumn = max(maxOnColumn, grid[m][k]);
//         }
//         // the sum by how much the height has increased in line in each column. Then save new max value for each element in line by column
//         sum += maxOnColumn - grid[i][k];
//         grid[i][k] = maxOnColumn;
//       }
//       // find min value between max element in each column and max element in line and remove this diff from sum
//       for (int n = 0; n < grid[i].length; n++) {
//         int minValue = min(grid[i][n], maxOnLine);
//         sum += minValue - grid[i][n];
//         grid[i][n] = minValue;
//       }
//     }
//     return sum;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.maxIncreaseKeepingSkyline([
    [3, 0, 8, 4],
    [2, 4, 5, 7],
    [9, 2, 6, 3],
    [0, 3, 1, 0]
  ]));
}
