// You are given an integer array nums with no duplicates. A maximum binary tree can be built recursively from nums using the following algorithm:

// Create a root node whose value is the maximum value in nums.
// Recursively build the left subtree on the subarray prefix to the left of the maximum value.
// Recursively build the right subtree on the subarray suffix to the right of the maximum value.
// Return the maximum binary tree built from nums.

// Example 1:

// Input: nums = [3,2,1,6,0,5]
// Output: [6,3,5,null,2,0,null,null,1]
// Explanation: The recursive calls are as follow:
// - The largest value in [3,2,1,6,0,5] is 6. Left prefix is [3,2,1] and right suffix is [0,5].
//     - The largest value in [3,2,1] is 3. Left prefix is [] and right suffix is [2,1].
//         - Empty array, so no child.
//         - The largest value in [2,1] is 2. Left prefix is [] and right suffix is [1].
//             - Empty array, so no child.
//             - Only one element, so child is a node with value 1.
//     - The largest value in [0,5] is 5. Left prefix is [0] and right suffix is [].
//         - Only one element, so child is a node with value 0.
//         - Empty array, so no child.
// Example 2:

// Input: nums = [3,2,1]
// Output: [3,null,2,null,1]

import 'dart:collection';
import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);

  @override
  String toString() {
    return 'TreeNode: val = $val; left = $left; right = $right; |||| \n';
  }
}

class Solution {
  TreeNode? constructMaximumBinaryTree(List<int> nums) {
    Queue<TreeNode> stack = Queue();

    for (int i = 0; i < nums.length; i++) {
      TreeNode curr = TreeNode(nums[i]);
      while (stack.isNotEmpty && stack.first.val < nums[i]) {
        curr.left = stack.removeFirst();
      }
      if (stack.isNotEmpty) {
        stack.first.right = curr;
      }
      stack.addFirst(curr);
    }

    return stack.isEmpty ? null : stack.removeLast();
  }
}

// class Solution {
//   TreeNode? constructMaximumBinaryTree(List<int> nums) {
//     return getTree(TreeNode(), nums);
//   }

//   TreeNode? getTree(TreeNode? treenode, List<int> nums) {
//     if (treenode == null) return treenode;
//     int maximun = nums.reduce(max);
//     int maxIndex = nums.lastIndexWhere((element) => element == maximun);
//     List<int> left = nums.sublist(0, maxIndex);
//     List<int> right = nums.sublist(
//         maxIndex + 1 <= nums.length ? maxIndex + 1 : nums.length, nums.length);
//     print('left $left');
//     print('right $right');
//     treenode.val = maximun;
//     if (left.isNotEmpty) {
//       treenode.left = TreeNode();
//       getTree(treenode.left, left);
//     }
//     if (right.isNotEmpty) {
//       treenode.right = TreeNode();
//       getTree(treenode.right, right);
//     }
//     return treenode;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.constructMaximumBinaryTree([3, 2, 1, 6, 0, 5]));
}

// Explanation For First Solution

// Let me try to explain the algorithm.
// If we have built the max binary tree for nums[0] ~ nums[i - 1], how can we insert nums[i] to the binary tree?
// Say the max binary tree for nums[0] ~ nums[i - 1] looks like:
//       A
//      / \
//   ...   B
//        / \
//     ...   C
//          / \
//       ...   ...
// Say the node for nums[i] is D.
// If D.val > A.val, then because A.val is at the left of D.val, we can just move the tree rooted at A to the left child of D.
//         D
//        /
//       A
//      / \
//   ...   B
//        / \
//     ...   C
//          / \
//       ...   ...
// If D.val < A.val, then because D.val is at the right of A.val, D must be put into the right subtree of A.
// Similarly, if D.val < B.val, then D must be put into the right subtree of B.
// Say B.val > D.val > C.val, then D should be the right child of B. (because D.val is at the right of B.val, and D.val is the biggest among the numbers at the right of B.val.)
// Because C.val < D.val, and C.val is at the left of D.val, C should become left child of D.
//       A
//      / \
//   ...   B
//        / \
//      ...  D
//          /
//         C
//        / \
//     ...   ...
// So to update the max binary tree for nums[0] ~ nums[i - 1], we need to know the nodes on the right path of the tree. (A, B, C, ...)
// How to maintain the path?
// Let's look at the property of the nodes.
// A is the biggest among nums[0] ~ nums[i - 1].
// B is the biggest for the numbers between A and nums[i] (exclusive).
// C is the biggest for the numbers between B and nums[i] (exclusive).
// Let's use a stack, and assume that the content of the stack contains the "right path" of nodes before the node for the current number.
// For the node of the new number, we should remove the nodes in the stack which are smaller than the current number.
// So we pop the stack until the top element of the stack is greater than the current number.
// Then, add the node for the current number to the stack.
// might be better to include some explanation as the implementation is a bit abstract.
// traverse the array once and create the node one by one. and use stack to store a decreasing sequence.
// each step, we create a new curNode. compare to the peek of stack,
// 2.a. keep popping the stack while (stack.peek().val < curNode.val), and set the last popping node to be curNode.left.
// Because the last one fulfilling the criteria is the largest number among curNode's left children. => curNode.left = last pop node
// 2.b. after popping up all nodes that fulfill (stack.peek().val < curNode.val),
// thus (stack.peek().val > curNode.val), the stack.peek() is curNode's root => peek.right = curNode
// return the bottom node of stack.