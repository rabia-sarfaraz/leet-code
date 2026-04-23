class Cashier(object):

    def __init__(self, n, discount, products, prices):
        self.n = n
        self.discount = discount
        self.count = 0
        
        # map product -> price
        self.price_map = {}
        for p, pr in zip(products, prices):
            self.price_map[p] = pr

    def getBill(self, product, amount):
        self.count += 1
        
        total = 0
        for p, a in zip(product, amount):
            total += self.price_map[p] * a
        
        # apply discount on every nth customer
        if self.count % self.n == 0:
            total -= (total * self.discount) / 100.0
        
        return total