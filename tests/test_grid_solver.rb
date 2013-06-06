require 'minitest/autorun'
require '../lib/cell.rb'
require '../lib/grid.rb'
require '../lib/grid_solver.rb'

class TestGridSolver < MiniTest::Test

  def test_grid_can_solve
    grid = Grid.new("009280000600004103105007490080405670200600301700823004861000530400500210030096007")
    solution = "349281765678954123125367498983415672254679381716823954861742539497538216532196847"
    GridSolver.new.solve(grid)
    assert_equal solution, cells_to_values(grid.sudoku_array).join
  end

  def cells_to_values(cells)
    cells.map(&:value)
  end

end