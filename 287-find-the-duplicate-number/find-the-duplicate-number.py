class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        for i in range(len(nums)):
            while nums[i] != i:
                d = nums[i]
                if nums[d] != nums[i]:
                    nums[d], nums[i] = nums[i], nums[d]
                else:
                    break
        
        return nums[0]