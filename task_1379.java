// Given two binary trees original and cloned and given a reference to a node target in the original tree.

// The cloned tree is a copy of the original tree.

// Return a reference to the same node in the cloned tree.

// Note that you are not allowed to change any of the two trees or the target node and the answer must be a reference to a node in the cloned tree.

// Example 1:

// Input: tree = [7,4,3,null,null,6,19], target = 3
// Output: 3
// Explanation: In all examples the original and cloned trees are shown. The target node is a green node from the original tree. The answer is the yellow node from the cloned tree.
// Example 2:

// Input: tree = [7], target =  7
// Output: 7
// Example 3:

// Input: tree = [8,null,6,null,5,null,4,null,3,null,2,null,1], target = 4
// Output: 4

// Constraints:

// The number of nodes in the tree is in the range [1, 104].
// The values of the nodes of the tree are unique.
// target node is a node from the original tree and is not null.

// Follow up: Could you solve the problem if repeated values on the tree are allowed?

class TreeNode implements Cloneable {
  int val;
  TreeNode left;
  TreeNode right;

  TreeNode(int x) {
    val = x;
  }

  @Override
  public String toString() {
    return "val = " + val + " " + "left = " + left + " " + "right = " + right + " ";
  }

  @Override
  public boolean equals(Object obj) {
    return this.val == ((TreeNode) obj).val;
  }

  @Override
  public int hashCode() {
    return this.val;
  }
}

class Solution1379 {
  TreeNode ans, target;

	public final TreeNode getTargetCopy(final TreeNode original, final TreeNode cloned, final TreeNode target) {
		if (original == null || original == target) return cloned;
		TreeNode res = getTargetCopy(original.left, cloned.left, target);
		if (res != null)
			return res;
		return getTargetCopy(original.right, cloned.right, target);
	}
}


// class Solution {
//   TreeNode ans, target;

//   public final TreeNode getTargetCopy(final TreeNode original, final TreeNode cloned, final TreeNode target) {
//     this.target = target;
//     inorder(original, cloned);
//     return ans;
//   }

//   public void inorder(TreeNode o, TreeNode c) {
//     if (o != null) {
//       inorder(o.left, c.left);
//       if (o == target) {
//         ans = c;
//       }
//       inorder(o.right, c.right);
//     }
//   }
// }

class Runner1379 {
  public static void main(String[] args) throws CloneNotSupportedException {
    Solution solution = new Solution();

    TreeNode original2 = new TreeNode(3);
    original2.left = new TreeNode(6);
    original2.right = new TreeNode(19);

    TreeNode original1 = new TreeNode(10);
    original1.left = new TreeNode(4);
    original1.right = original2;

    // TreeNode copy = (TreeNode) original1.clone();
    TreeNode copy = original1;

    System.out.println("original1 ===== " + original1);
    System.out.println("copy      ===== " + copy);
    System.out.println(solution.getTargetCopy(original1, copy, new TreeNode(3)));
  }
}