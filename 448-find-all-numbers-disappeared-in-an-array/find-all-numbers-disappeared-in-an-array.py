class Solution:
    def findDisappearedNumbers(self, nums: List[int]) -> List[int]:
        list1 = []
        for i in range(len(nums)):
            while nums[i] != i + 1:
                d = nums[i] - 1
                if nums[d] != nums[i]:
                    nums[i], nums[d] = nums[d], nums[i]
                else:
                    break
        for i in range(len(nums)):
            if nums[i] != i + 1:
                list1.append(i+ 1)

        return list1