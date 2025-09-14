class Solution:
    def numOfSubarrays(self, arr: List[int]) -> int:
        dict1 = {1: 0, 0: 1}  # 1 = ODD, 0 = EVEN → prefix sum starts at 0 (even)
        global_odd = 0
        prefix_sum = 0

        for i in range(0, len(arr)):
            prefix_sum += arr[i]

            if prefix_sum % 2 == 0:  # EVEN prefix
                global_odd += dict1[1]  # count of previous ODD prefix sums
            else:  # ODD prefix
                global_odd += dict1[0]  # count of previous EVEN prefix sums

            # Update current parity count in dict
            parity = prefix_sum % 2
            dict1[parity] += 1

        return global_odd % (10**9 + 7)



