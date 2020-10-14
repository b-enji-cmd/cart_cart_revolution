require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCardTest < Minitest::Test
  #Iteration 2
    def setup
        @cart = ShoppingCart.new("King Soopers", "30items")
        @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        @product2 = Product.new(:meat, 'chicken', 4.50, '2')
        @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    end
    
    def test_it_exists
        assert_instance_of ShoppingCart , @cart
    end

    def test_it_has_a_name
        assert_equal 'King Soopers' , @cart.name
    end

    def test_it_has_a_capacity
        assert_equal 30 , @cart.capacity
    end

    def test_it_has_products
        assert_equal [] , @cart.products
    end

    def test_it_can_add_products
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        assert_equal [@product1, @product2], @cart.products
    end

    def test_it_can_relay_cart_details
        details_data = {name: "King Soopers", capacity: 30}
        assert_equal details_data, @cart.details
    end
    #Iteration 3

    def test_it_can_return_total_products
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)
        assert_equal 13 , @cart.total_number_of_products
    end

    def test_it_can_return_state_of_is_full
        @cart_2 = ShoppingCart.new("King Soopers", "30items")
        @big_product = Product.new(:paper, 'tissue paper', 1.25, '40')

        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)

        @cart_2.add_product(@big_product)

        assert @cart_2.is_full?
        refute @cart.is_full?
    end

    def test_it_can_index_products_by_category
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)

        assert_equal [@product1,@product3] , @cart.products_by_category(:paper)
    end

    #Iteration 4

    def test_it_can_calculate_percentage_occupied

        @product4 = Product.new(:paper, 'toilet paper', 3.70, '10')
        @product5 = Product.new(:meat, 'chicken', 4.50, '2')
        @product6 = Product.new(:paper, 'tissue paper', 1.25, '1')
        @cart.add_product(@product4)
        @cart.add_product(@product5)
        @cart.add_product(@product6)

        
        assert_equal 43.33 , @cart.percentage_occupied
    end

    def test_it_can_sort_products_by_quantity
        @product4 = Product.new(:paper, 'toilet paper', 3.70, '10')
        @product5 = Product.new(:meat, 'chicken', 4.50, '2')
        @product6 = Product.new(:paper, 'tissue paper', 1.25, '1')
        @product7 = Product.new(:produce, 'apples', 0.99, '20')
        @cart.add_product(@product4)
        @cart.add_product(@product5)
        @cart.add_product(@product6)
        @cart.add_product(@product7)

        assert_equal [@product7, @product4, @product5, @product6] , @cart.sorted_products_by_quantity
    end
    def test_it_can_give_product_breakdown
        @product4 = Product.new(:paper, 'toilet paper', 3.70, '10')
        @product5 = Product.new(:meat, 'chicken', 4.50, '2')
        @product6 = Product.new(:paper, 'tissue paper', 1.25, '1')
        @product7 = Product.new(:produce, 'apples', 0.99, '20')
        @cart.add_product(@product4)
        @cart.add_product(@product5)
        @cart.add_product(@product6)
        @cart.add_product(@product7)
        
        breakdown_data = {:meat => @product5 , :paper => @product4,:paper => @product6, :produce=> @product7}
        assert_equal breakdown_data , @cart.product_breakdown
    end

end

#require'pry';binding.pry

