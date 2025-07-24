class Solution:
    def average(self, salary: List[int]) -> float:
        min_sal = min(salary)
        max_sal = max(salary)

        sum1 = sum(salary) - min_sal - max_sal
        avg_sal = sum1 / (len(salary) - 2)
        return avg_sal