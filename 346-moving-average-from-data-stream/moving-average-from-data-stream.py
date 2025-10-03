class MovingAverage:

    def __init__(self, size: int):
        self.q = deque()
        self.sum1 = 0
        self.size = size

    def next(self, val: int) -> float:
        self.sum1 += val
        self.q.append(val)
        if len(self.q) > self.size:
            prev1 = self.q.popleft()
            self.sum1 -= prev1

        return self.sum1 / len(self.q)


# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage(size)
# param_1 = obj.next(val)