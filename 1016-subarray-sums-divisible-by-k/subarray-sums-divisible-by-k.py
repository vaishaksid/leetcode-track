class Solution:
    def subarraysDivByK(self, nums: List[int], k: int) -> int:
        total = 0
        prefix = 0
        freq = {}                # remainder -> count
        freq[0] = 1              # base case: empty prefix remainder

        for x in nums:
            prefix = (prefix + x) % k   # calculate running remainder

            # if this remainder has been seen before, add its count
            if prefix in freq:
                total += freq[prefix]
                freq[prefix] += 1
            else:
                freq[prefix] = 1

        return total