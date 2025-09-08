class NumArray:

    def __init__(self, nums: List[int]):
        self.newarr = []
        self.runningSum = 0
        self.out = []
        for i in range(0, len(nums)):
            self.runningSum += nums[i]
            self.newarr.append(self.runningSum)

    def sumRange(self, left: int, right: int) -> int:
        rightSum = self.newarr[right]
        if left == 0:
            return rightSum
        else:
            return rightSum - (self.newarr[left-1])


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(left,right)