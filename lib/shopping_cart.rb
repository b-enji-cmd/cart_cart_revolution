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

    def calculate_total
        total = 0
        @products.each do |product|
            total += product.quantity
        end
        total
    end

    def total_number_of_products
        calculate_total
    end

    def is_full?
        total_number_of_products > capacity
    end

    def products_by_category(category)
        @products.find_all{|product| product.category == category}
    end

    def percentage_occupied
        (((total_number_of_products).to_f / @capacity.to_f ) *100).truncate(2)
    end

    def sorted_products_by_quantity
        @products.sort_by{|product| product.quantity}.reverse
    end

    def product_breakdown
        breakdown = Hash.new

        @products.each do |product|
            breakdown[product.category] = product
        end

        breakdown
    end
end