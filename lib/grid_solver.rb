class GridSolver

  attr_accessor :grid

  def initialize(input)
    @grid = Grid.new(input)
  end  

  def solve
    while !@grid.solved?
      @grid.sudoku_array.each_with_index do |cell, index|
        cell.update_value(grid.neighbours(index)) unless cell.solved?
      end
    end   
  end

  # def print_out_grid
  #   values = @grid.sudoku_array.map do |x| 
  #     puts x.value 
  #   end 
    
  #   values.each { |value| 
  #   puts "/n" if value % 9 == 0
  #   puts value }
  end  

end
