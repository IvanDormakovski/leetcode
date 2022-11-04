// Given the root of a binary tree, return the sum of values of its deepest leaves.

// Example 1:

// Input: root = [1,2,3,4,5,null,6,7,null,null,null,null,8]
// Output: 15
// Example 2:

// Input: root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
// Output: 19

// Constraints:

// The number of nodes in the tree is in the range [1, 104].
// 1 <= Node.val <= 100

import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);

  @override
  String toString() {
    return 'TreeNode: val = $val';
  }
}

class Solution {
  int deepestLeavesSum(TreeNode? root) {
    int res = 0, i = 0;
    Queue queue = Queue();
    queue.add(root);
    while (queue.isNotEmpty) {
      res = 0;
      for (i = queue.length - 1; i >= 0; --i) {
        TreeNode temp = queue.removeFirst();
        res += temp.val;
        if (temp.right != null) queue.add(temp.right);
        if (temp.left != null) queue.add(temp.left);
      }
    }
    return res;
  }
}

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.deepestLeavesSum(
    TreeNode(
      1,
      TreeNode(
        2,
        TreeNode(
          4,
          TreeNode(7),
          null,
        ),
        TreeNode(5),
      ),
      TreeNode(
        3,
        null,
        TreeNode(
          6,
          TreeNode(10),
          null,
        ),
      ),
    ),
  ));

  // print(solution.deepestLeavesSum(
  //   TreeNode(
  //     1,
  //     TreeNode(
  //       2,
  //       TreeNode(
  //         4,
  //         TreeNode(7),
  //         null,
  //       ),
  //       TreeNode(5),
  //     ),
  //     TreeNode(
  //       3,
  //       null,
  //       TreeNode(
  //         6,
  //         null,
  //         TreeNode(8),
  //       ),
  //     ),
  //   ),
  // ));
}
