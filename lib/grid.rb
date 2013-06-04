class Grid

	attr_accessor :sudoku_string

	def initialize(input)
		@sudoku_string = input.split('').map { |x| x.to_i }
	end

	def rows(cell_index)
		@row_index = cell_index / 9
		row_start_index = @row_index * 9
		row_end_index = row_start_index + 9 - 1
		@sudoku_string[row_start_index..row_end_index]
	end
	# @sudoku_string.each_slice(9).to_a


	def columns(cell_index)
		@column_index = cell_index % 9
		column_values = []
		column_values << @sudoku_string[@column_index]
		8.times do
			column_values << @sudoku_string[@column_index += 9]
		end
		column_values
	end

	def subgrids(cell_index)
		row_block_index = (cell_index / 9) / 3
		column_block_index = (cell_index % 9) / 3
		subgrid_start_row_index = (3 * row_block_index * 9) + (3 * column_block_index)
		subgrid_values = []
		subgrid_values << @sudoku_string[subgrid_start_row_index]
		2.times do
			subgrid_values << @sudoku_string[subgrid_start_row_index + 1]
			subgrid_values << @sudoku_string[subgrid_start_row_index + 2]
			subgrid_values << @sudoku_string[subgrid_start_row_index += 9]	
		end
		subgrid_values << @sudoku_string[subgrid_start_row_index + 1]
		subgrid_values << @sudoku_string[subgrid_start_row_index + 2]
		subgrid_values
	end
end