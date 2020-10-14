class ShoppingCart
    attr_reader :name, :capacity , :products, :details
    def initialize(name, capacity, products = [])
        @name = name
        @capacity = capacity.to_i
        @products = products
        @details = {name: @name,  capacity: @capacity.to_i, }
    end

    def add_product(product)
        products << product
    end
end