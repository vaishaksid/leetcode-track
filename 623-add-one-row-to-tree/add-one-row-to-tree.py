# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

from collections import deque

class Solution:
    def addOneRow(self, root: Optional[TreeNode], val: int, depth: int) -> Optional[TreeNode]:
        # Special case: inserting at root
        if depth == 1:
            new_root = TreeNode(val)
            new_root.left = root
            return new_root

        q = deque([root])
        curr = 1  # Track current depth

        while q:
            len1 = len(q)

            # If we're at the level just above the target depth
            if curr == depth - 1:
                for i in range(len1):
                    node = q.popleft()

                    # Insert new left node
                    new_node_l = TreeNode(val)
                    new_node_l.left = node.left  # Link original left child
                    node.left = new_node_l

                    # Insert new right node
                    new_node_r = TreeNode(val)
                    new_node_r.right = node.right  # Link original right child
                    node.right = new_node_r
                break  # Insertion done, no further traversal needed

            # BFS traversal to next level
            for i in range(len1):
                node = q.popleft()
                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)

            curr += 1  # Increment depth level

        return root


                

