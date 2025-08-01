class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        m = len(matrix)         # number of rows
        n = len(matrix[0])      # number of columns (assumes all rows are same length)
        maxcol = n - 1
        minrow = 0
        while maxcol >= 0 and minrow <= m -1:
            if target == matrix[minrow][maxcol]:
                return True
            elif target > matrix[minrow][maxcol]:
                minrow += 1
            else:
                maxcol -= 1
        
        return False

