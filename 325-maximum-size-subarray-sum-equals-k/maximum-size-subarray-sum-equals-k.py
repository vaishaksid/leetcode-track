class Solution:
    def maxSubArrayLen(self, nums: List[int], k: int) -> int:
        prefix_sum = 0
        max_length = 0
        prefix_map = {0: -1}  # Initialize with prefix_sum 0 at virtual index -1

        for i in range(len(nums)):
            prefix_sum += nums[i]

            # Check if there was a previous prefix sum that would form sum == k
            if (prefix_sum - k) in prefix_map:
                length = i - prefix_map[prefix_sum - k]
                max_length = max(max_length, length)  # Update global max length

            # Only store the first occurrence of each prefix sum
            if prefix_sum not in prefix_map:
                prefix_map[prefix_sum] = i

        return max_length