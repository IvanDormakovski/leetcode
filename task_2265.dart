// Given the root of a binary tree, return the number of nodes where the value of the node is equal to the average of the values in its subtree.

// Note:

// The average of n elements is the sum of the n elements divided by n and rounded down to the nearest integer.
// A subtree of root is a tree consisting of root and all of its descendants.

// Example 1:

// Input: root = [4,8,5,0,1,null,6]
// Output: 5
// Explanation:
// For the node with value 4: The average of its subtree is (4 + 8 + 5 + 0 + 1 + 6) / 6 = 24 / 6 = 4.
// For the node with value 5: The average of its subtree is (5 + 6) / 2 = 11 / 2 = 5.
// For the node with value 0: The average of its subtree is 0 / 1 = 0.
// For the node with value 1: The average of its subtree is 1 / 1 = 1.
// For the node with value 6: The average of its subtree is 6 / 1 = 6.
// Example 2:

// Input: root = [1]
// Output: 1
// Explanation: For the node with value 1: The average of its subtree is 1 / 1 = 1.

// Constraints:

// The number of nodes in the tree is in the range [1, 1000].
// 0 <= Node.val <= 1000

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int result = 0;

  int averageOfSubtree(TreeNode? root) {
    dfs(root);
    return result;
  }

  List<int> dfs(TreeNode? node) {
    if (node == null) return [0, 0];
    List<int> left = dfs(node.left);
    List<int> right = dfs(node.right);
    int currentSum = left[0] + right[0] + node.val;
    print(
        'currentSum | left ${left[0]} + right ${right[0]} + node.val ${node.val}');
    int currentCount = left[1] + right[1] + 1;
    print('currentCount / left ${left[1]} + right ${right[1]}');
    if (currentSum ~/ currentCount == node.val) result++;
    return [currentSum, currentCount];
  }
}

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.averageOfSubtree(
    TreeNode(
      4,
      TreeNode(
        8,
        TreeNode(0),
        TreeNode(1),
      ),
      TreeNode(
        5,
        null,
        TreeNode(6),
      ),
    ),
  ));
}
