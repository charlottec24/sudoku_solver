class GridSolver

  def solve(grid)
    while !grid.solved?
      grid.sudoku_array.each_with_index do |cell, index|
        cell.update_value(grid.neighbours(index)) unless cell.solved?
      end
    end   
  end

end