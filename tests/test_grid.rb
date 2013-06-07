require 'minitest/autorun'
require '../lib/grid.rb'
require '../lib/cell'

class TestGrid < MiniTest::Test

	def setup
		@grid = Grid.new("005360000704000000032000804080500070360801050000020090900100200100009703050730060")
	end

	def test_input
		assert_equal 81, @grid.sudoku_array.size
		assert_equal 06, @grid.sudoku_array[4].value
	end	

	def test_row
		assert_equal [7, 0, 4, 0, 0, 0, 0, 0, 0], cells_to_values(@grid.rows(11)) 
	end
	
	def test_column
		assert_equal [0, 0, 4, 0, 0, 0, 0, 3, 0], cells_to_values(@grid.columns(35))
		assert_equal [0, 0, 8, 0, 0, 0, 2, 7, 0], cells_to_values(@grid.columns(24))
	end

	def test_subgrid
		assert_equal [0, 0, 5, 7, 0, 4, 0, 3, 2], cells_to_values(@grid.subgrids(0))
		assert_equal [2, 0, 0, 7, 0, 3, 0, 6, 0], cells_to_values(@grid.subgrids(71))
	end

	def cells_to_values(cells)
		cells.map(&:value)
	end

end




