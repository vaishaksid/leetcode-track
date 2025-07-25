# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isCompleteTree(self, root: Optional[TreeNode]) -> bool:
        if root is None:
            return False
        expected_index = 1
        q = deque([[root, 1]])
        while q:
            len1 = len(q)
            for i in range(len1):
                node, index = q.popleft() 
                if expected_index == index:
                    expected_index += 1
                else:
                    return False
                if node.left:
                    q.append([node.left, 2 * index])
                if node.right:
                    q.append([node.right, (2 * index) + 1])       
        return True
                  
                
        



       
            