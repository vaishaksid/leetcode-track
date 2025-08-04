# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def verticalTraversal(self, root: Optional[TreeNode]) -> List[List[int]]:
        list1 = []
        max_num = min_num = 0
        q = deque([[root, 0, 0]])
        dict1 = {}
        y = 0
        while q:
            node, x, y = q.popleft()
            if x not in dict1:
                dict1[x] = []
            dict1[x].append((y, node.val))
            if x >= 0:
                max_num = max(max_num, x)
            else:
                min_num = min(min_num, x)

            if node.left:
                q.append([node.left, x - 1, y + 1])
            if node.right:
                q.append([node.right, x + 1, y + 1])
            
        for i in range(min_num, max_num + 1):
            column = sorted(dict1[i])
            list1.append([val for y, val in column])
        
        return list1

