# require 'minitest/autorun'
# require '../lib/grid.rb'

# class TestGrid < Minitest::Test

# 	def setup
# 		@input = Grid.new("005360000704000000032000804080500070360801050000020090900100200100009703050730060")
# 	end

# 	def test_input
# 		assert_equal 81, input.sudoku_string.size
# 	end

# 	def test_sudoku_array
# 		@input.split('')
# 		@input.each { |x| [[x, x, x]]}
# 	end
# end

input = "005360000704000000032000804080500070360801050000020090900100200100009703050730060"
t = input.scan(/.{9}/)
puts t.to_a


