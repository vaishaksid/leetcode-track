# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findBottomLeftValue(self, root: Optional[TreeNode]) -> int:
        global_list = []
        level = 0
        def helper(node, level):
            # Base Case
            if node.left is None and node.right is None:
                if len(global_list) == 0:
                    global_list.append([level, node.val])
                else:
                    if level > global_list[0][0]:
                        global_list.pop()
                        global_list.append([level, node.val])
            
            # Recursive Case
            if node.left:
                helper(node.left, level + 1)
            if node.right:
                helper(node.right, level + 1)
        helper(root, 0)
        return global_list[0][1]