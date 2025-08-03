# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def verticalOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root:
            return []

        dict1 = {}
        list1 = []
        q = deque([[root, 0]])
        max_num = 0
        min_num = 0

        while q:
            node, level = q.popleft()

            if level in dict1:
                dict1[level].append(node.val)
            else:
                dict1[level] = [node.val]

            max_num = max(max_num, level)
            min_num = min(min_num, level)

            if node.left:
                q.append([node.left, level - 1])
            if node.right:
                q.append([node.right, level + 1])

        for i in range(min_num, max_num + 1):
            list1.append(dict1[i])

        return list1

        

