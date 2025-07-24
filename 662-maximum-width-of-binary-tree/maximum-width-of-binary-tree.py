# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque

class Solution:
    def widthOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        """
        Problem:
        Given a binary tree, return the maximum width of the given tree.
        The width of one level is defined as the length between the end-nodes 
        (the leftmost and rightmost non-null nodes), measured using the node positions 
        as if the tree were a complete binary tree.

        Concept:
        We simulate the tree as if it's a complete binary tree using 1-based indexing.
        For any node at index `i`:
          - Left child = 2 * i
          - Right child = 2 * i + 1
        This preserves the "gaps" between nodes so we can compute width accurately.
        """

        # Version 1: Clean and optimized
        if not root:
            return 0

        q = deque([(root, 1)])  # (node, index in virtual complete binary tree)
        max_width = 0

        while q:
            level_length = len(q)
            _, first_index = q[0]
            _, last_index = q[-1]
            # Width of current level: rightmost - leftmost + 1
            max_width = max(max_width, last_index - first_index + 1)

            for _ in range(level_length):
                node, idx = q.popleft()
                if node.left:
                    q.append((node.left, 2 * idx))
                if node.right:
                    q.append((node.right, 2 * idx + 1))

        return max_width

        # Version 2: Verbose, stores width per level (uncomment below to use)
        """
        if not root:
            return 0

        q = deque([(root, 1)])
        widths = []

        while q:
            level_size = len(q)
            index_list = []

            for _ in range(level_size):
                node, idx = q.popleft()
                if node.left:
                    q.append((node.left, 2 * idx))
                if node.right:
                    q.append((node.right, 2 * idx + 1))
                index_list.append(idx)

            # Width of level = max index - min index + 1
            widths.append(max(index_list) - min(index_list) + 1)

        return max(widths)
        """


                
                   

            
            