class Solution:
    def minSwapsCouples(self, row: List[int]) -> int:
        dict1 = {}
        for i in range(len(row)):
            dict1[row[i]] = i
        swaps = 0
        for i in range(1, len(row)-1, 2):
            first_index = i - 1
            second_index = i
            first_value = row[first_index]
            partner = first_value ^ 1
            second_value = row[second_index]
            if second_value != partner:
                partner_index = dict1[partner]
                row[partner_index], row[i] = row[i], row[partner_index]
                dict1[partner] = i
                dict1[second_value] = partner_index
                swaps +=1
        return swaps

            
 