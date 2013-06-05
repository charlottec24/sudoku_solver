require 'minitest/autorun'
require '../lib/grid.rb'

class TestGrid < MiniTest::Test

	def setup
		@grid = Grid.new("005360000704000000032000804080500070360801050000020090900100200100009703050730060")
	end

	def test_input
		assert_equal 81, @grid.sudoku_string.size
		assert_equal 06, @grid.sudoku_string[4]
	end	

  	def test_row
  		assert_equal [7, 0, 4, 0, 0, 0, 0, 0, 0], @grid.rows(11)  
  	end
	
	def test_column
		assert_equal [0, 0, 4, 0, 0, 0, 0, 3, 0], @grid.columns(35)
		assert_equal [0, 0, 8, 0, 0, 0, 2, 7, 0], @grid.columns(24)
	end

	def test_subgrid
		assert_equal [0, 0, 5, 7, 0, 4, 0, 3, 2], @grid.subgrids(0)
		assert_equal [2, 0, 0, 7, 0, 3, 0, 6, 0], @grid.subgrids(71)
	end

	def test_grid_can_solve
		grid = Grid.new("009280000600004103105007490080405670200600301700823004861000530400500210030096007")
		solution = "349281765678954123125367498983415672254679381716823954861742549497538216532196847"
		grid.solve
		assert_equal solution, grid.sudoku_string.join
	end

end




