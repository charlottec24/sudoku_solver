class Grid

	attr_accessor :sudoku_array

	def initialize(input)
		@sudoku_array = input.split('').map { |value| Cell.new(value.to_i) }
	end

	def rows(cell_index)
		@sudoku_array[(cell_index / 9) * 9..((cell_index / 9) * 9) + 8]
	end

	def columns(cell_index)
		column_index = cell_index % 9
		column_values = []
		column_values << @sudoku_array[column_index]
		8.times do
			column_values << @sudoku_array[column_index += 9]
		end
		column_values
	end

	def subgrids(cell_index)
		row_block_index = (cell_index / 9) / 3
		column_block_index = (cell_index % 9) / 3
		subgrid_start_row_index = (3 * row_block_index * 9) + (3 * column_block_index)
		subgrid_values = []
		subgrid_values << @sudoku_array[subgrid_start_row_index]
		3.times do |x|
			subgrid_values << @sudoku_array[subgrid_start_row_index + 1]
			subgrid_values << @sudoku_array[subgrid_start_row_index + 2]
			break if x == 2
			subgrid_values << @sudoku_array[subgrid_start_row_index += 9]	
		end
		subgrid_values
	end

	def solved?
		@sudoku_array.all?{|x| x.solved?}
	end

	def solve
		while !solved?
			@sudoku_array.each_with_index do |cell, index|
				cell.update(rows(index) + columns(index) + subgrids(index)) unless cell.solved?
			end
		end		
	end
end