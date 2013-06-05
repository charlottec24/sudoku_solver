class Grid

	attr_accessor :sudoku_string

	def initialize(input)
		@sudoku_string = input.split('').map { |x| x.to_i }
	end

	def rows(cell_index)
		# row_start_index = (cell_index / 9) * 9
		# row_end_index = row_start_index + 8
		@sudoku_string[(cell_index / 9) * 9..((cell_index / 9) * 9) + 8]
	end
	# @sudoku_string.each_slice(9).to_a


	def columns(cell_index)
		column_index = cell_index % 9
		column_values = []
		column_values << @sudoku_string[column_index]
		8.times do
			column_values << @sudoku_string[column_index += 9]
		end
		column_values
	end

	def subgrids(cell_index)
		row_block_index = (cell_index / 9) / 3
		column_block_index = (cell_index % 9) / 3
		subgrid_start_row_index = (3 * row_block_index * 9) + (3 * column_block_index)
		subgrid_values = []
		subgrid_values << @sudoku_string[subgrid_start_row_index]
		3.times do |x|
			subgrid_values << @sudoku_string[subgrid_start_row_index + 1]
			subgrid_values << @sudoku_string[subgrid_start_row_index + 2]
			break if x == 2
			subgrid_values << @sudoku_string[subgrid_start_row_index += 9]	
		end
		subgrid_values
	end

	def not_solved
		@sudoku_string.any? {|n| n == 0}
	end

	def solve
		while not_solved
			@sudoku_string.each_with_index do |item, index|				
				next if item != 0
				possible_values = (1..9).to_a - rows(index) - columns(index) - subgrids(index)
				if possible_values.length == 1
					@sudoku_string[index] = possible_values.first
				end
				# if item == 0 || item.size > 1
				# 	item = [1, 2, 3, 4, 5, 6, 7, 8, 9]
				# 	item = item - rows(index) - columns(index) - subgrids(index)
				# else 
				# 	item
				# end
			end
		end		
	end
end