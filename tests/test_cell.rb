require 'minitest/autorun'
require '../lib/cell.rb'

class Test < MiniTest::Test

	def test_cell_accept_value
		cell = Cell.new(5)
		assert_equal 5, cell.value		
	end

	def test_cell_can_be_solved
		cell = Cell.new(3)
		assert cell.solved?
	end

	def test_can_calculate_own_value
		cell = Cell.new(0)
		neighbours = [1,2,3,4,6,7,8,9].map{|n| Cell.new(n)}
		refute cell.solved?
		cell.update(neighbours)
		assert cell.solved?
		assert_equal 5, cell.value
	end

	def test_can_calculate_neighbours
	end

end