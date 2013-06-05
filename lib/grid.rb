class Grid

	attr_accessor :sudoku_array

	def initialize(input)
		@sudoku_array = input.split('').map { |value| Cell.new(value) }
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
		@cells.all(&:solved?)
	end

	def not_solved		
		@sudoku_array.any? {|n| n == 0}
	end

	# def solve
	# 	while not_solved
	# 		@sudoku_array.each_with_index do |item, index|				
	# 			next if item != 0
	# 			possible_values = (1..9).to_a - rows(index) - columns(index) - subgrids(index)
	# 			if possible_values.length == 1
	# 				@sudoku_array[index] = possible_values.first
	# 			end
	# 		end
	# 	end		
	# end

	def solve
		while not_solved
			@sudoku_array.each_with_index do |item, index|				
				next if item != 0
				item.update(rows(index), columns(index), subgrids(index))
			end
		end		
	end
end