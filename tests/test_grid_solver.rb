require 'minitest/autorun'
require '../lib/cell.rb'
require '../lib/grid.rb'
require '../lib/grid_solver.rb'

class TestGridSolver < MiniTest::Test

  def test_grid_can_solve
    input = "009280000600004103105007490080405670200600301700823004861000530400500210030096007"
    solution = "349281765678954123125367498983415672254679381716823954861742539497538216532196847"
    grid_solver = GridSolver.new(input)
    grid_solver.solve
    assert_equal solution, cells_to_values(grid_solver.grid.sudoku_array).join
    grid_solver.print_out_grid
  end  

  def cells_to_values(cells)
    cells.map(&:value)
  end

end