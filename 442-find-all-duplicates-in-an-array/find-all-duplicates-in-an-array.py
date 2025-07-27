class Solution:
    def findDuplicates(self, nums: List[int]) -> List[int]:
        list1 = []
        for i in range(len(nums)):
            while nums[i] != i + 1:
                d = nums[i] - 1
                if nums[i] != nums[d]:
                    nums[i], nums[d] = nums[d], nums[i]
                else:
                    break
        
        for i in range(len(nums)):
            if nums[i] != i + 1:
                list1.append(nums[i])
    
        return list1