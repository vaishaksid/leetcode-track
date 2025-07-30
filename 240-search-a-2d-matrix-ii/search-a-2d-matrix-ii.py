class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        j = len(matrix[0])
        for list1 in matrix:
            i = 0
            while i < j:
                if list1[i] == target:
                    return True
                elif list1[i] < target:
                    i += 1
                else:
                    j = i
        return False 
            
