// Given the root of a binary tree, return the sum of values of nodes with an even-valued grandparent. If there are no nodes with an even-valued grandparent, return 0.

// A grandparent of a node is the parent of its parent if it exists.

// Example 1:

// Input: root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
// Output: 18
// Explanation: The red nodes are the nodes with even-value grandparent while the blue nodes are the even-value grandparents.
// Example 2:

// Input: root = [1]
// Output: 0

// Constraints:

// The number of nodes in the tree is in the range [1, 104].
// 1 <= Node.val <= 100

import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int sumEvenGrandparent(TreeNode? root) {
    return helper(root, 1, 1);
  }

  int helper(TreeNode? node, int parent, int grandparent) {
    if (node == null) return 0;
    return helper(node.left, node.val, parent) +
        helper(node.right, node.val, parent) +
        (grandparent % 2 == 0 ? node.val : 0);
  }
}

// class Solution {
//   int sumEvenGrandparent(TreeNode? root) {
//     int sum = 0;
//     if (root == null) return sum;
//     Queue queue = Queue();
//     queue.add(root);
//     while (queue.isNotEmpty) {
//       TreeNode grand = queue.removeFirst();
//       if (grand.right != null) {
//         if (grand.val % 2 == 0) {
//           sum += ((grand.right?.left?.val ?? 0) + (grand.right?.right?.val ?? 0));
//         }
//         queue.add(grand.right);
//       }
//       if (grand.left != null) {
//         if (grand.val % 2 == 0) {
//           sum += ((grand.left?.left?.val ?? 0) + (grand.left?.right?.val ?? 0));
//         }
//         queue.add(grand.left);
//       }
//     }
//     return sum;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.sumEvenGrandparent(
    TreeNode(
      6,
      TreeNode(
        7,
        TreeNode(
          2,
          TreeNode(
            9,
          ),
        ),
        TreeNode(
          7,
          TreeNode(
            1,
          ),
          TreeNode(
            4,
          ),
        ),
      ),
      TreeNode(
        8,
        TreeNode(
          1,
        ),
        TreeNode(
          3,
          null,
          TreeNode(
            5,
          ),
        ),
      ),
    ),
  ));
}
