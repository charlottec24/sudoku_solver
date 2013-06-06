class Grid

	attr_accessor :sudoku_array

	def initialize(input)
		@sudoku_array = input.split('').map { |value| Cell.new(value.to_i) }
	end

	def rows(cell_index)
		start_index_of_row = (cell_index / 9) * 9
		last_index_of_row = start_index_of_row + 8 
		@sudoku_array[start_index_of_row..last_index_of_row]
	end

	def columns(cell_index)
		column_index = cell_index % 9
		column_values = []
		(0..8).each do |x|
			column_values << @sudoku_array[column_index + x * 9]
		end
		column_values
	end

	def subgrids(cell_index)
		subgrid_start_row_index = subgrid_start_row_index_calculate(cell_index)
		subgrid_values = []
		(0..2).each do |x|
			(0..2).each do |y|
				subgrid_values << @sudoku_array[subgrid_start_row_index + (9 * x) + y]	
			end
		end
		subgrid_values
	end

	def subgrid_start_row_index_calculate(cell_index)
		row_block_index = (cell_index / 9) / 3
		column_block_index = (cell_index % 9) / 3
		subgrid_start_row_index = (3 * row_block_index * 9) + (3 * column_block_index)
	end

	def solved?
		@sudoku_array.all?{|x| x.solved?}
	end

	def neighbours(index)
		rows(index) + columns(index) + subgrids(index)
	end

end